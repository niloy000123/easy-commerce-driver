import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_ecommerce_delivery_app/core/constants/hive_contents.dart';
import 'package:simple_ecommerce_delivery_app/core/localization/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(AppHSC.authBox);
  await Hive.openBox(AppHSC.userBox);
  await Hive.openBox(AppHSC.appSettingsBox);
  await initDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Locale resolveLocal({required String langCode}) {
    return Locale(langCode);
  }

  final GoRouter appRouter = serviceLocator<AppRouter>().router;
  bool themeStatusIsDark = false;
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  changeStatusBarColor() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent background
        systemNavigationBarColor: Colors.transparent, // optional: nav bar too
        systemNavigationBarDividerColor: Colors.transparent,
        statusBarIconBrightness: themeStatusIsDark
            ? Brightness.light
            : Brightness.dark, // Black icons
        statusBarBrightness: themeStatusIsDark
            ? Brightness.dark
            : Brightness.light, // For iOS
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917), // XD Design Sizes
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return ValueListenableBuilder(
          valueListenable: Hive.box(AppHSC.appSettingsBox).listenable(),
          builder: (context, appSettingsBox, _) {
            final isDark =
                appSettingsBox.get(AppHSC.isDarkTheme, defaultValue: false)
                    as bool;
            final selectedLocal =
                appSettingsBox.get(AppHSC.appLocal) as String?;
            if (selectedLocal == null) {
              appSettingsBox.put(AppHSC.appLocal, 'en');
            }

            final selectedLocale =
                appSettingsBox.get(AppHSC.appLocal, defaultValue: 'en')
                    as String;

            return AnnotatedRegion(
              value: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent, // transparent status bar
                systemNavigationBarColor: Colors.black, // navigation bar color
                statusBarIconBrightness:
                    Brightness.dark, // status bar icons' color
                systemNavigationBarIconBrightness:
                    Brightness.dark, //navigation bar icons' color
              ),
              child: MaterialApp(
                title: 'Demo',
                debugShowCheckedModeBanner: false,
                themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
                theme: getAppTheme(context: context, isDarkTheme: false),
                darkTheme: getAppTheme(context: context, isDarkTheme: true),
                locale: Locale(selectedLocale),
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                builder: EasyLoading.init(),
                home: Router(
                  routerDelegate: appRouter.routerDelegate,
                  routeInformationParser: appRouter.routeInformationParser,
                  routeInformationProvider: appRouter.routeInformationProvider,
                  backButtonDispatcher: RootBackButtonDispatcher(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
