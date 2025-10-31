import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.hiveService});
  final HiveService hiveService;
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _delayAndGotoNextScreen() async {
    var token = widget.hiveService.getUserAuthToken();
    if (token != null) {
      apiClient.updateToken(token: token);
    }
    if (widget.hiveService.isFirstOpen()) {
      context.goNamed(AppRoute.welcome.name);
    } else {
      context.goNamed(AppRoute.signIn.name);
    }
  }

  /* <---- Initial state ----> */
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 2),
      ).then((value) => _delayAndGotoNextScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(ApGlobalFunctions.navigatorKey.currentState!.context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      /* <-------- Content --------> */
      // backgroundColor: colors(context).primaryColor,
      body: Center(
        child: Image.asset(
          Assets.images.appLogo.path,
          width: 240.w,
          height: 240.w,
        ),
      ),
    );
  }
}
