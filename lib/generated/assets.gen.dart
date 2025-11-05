// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_left.png
  AssetGenImage get arrowLeft =>
      const AssetGenImage('assets/icons/arrow_left.png');

  /// File path: assets/icons/by_cycle.png
  AssetGenImage get byCycle => const AssetGenImage('assets/icons/by_cycle.png');

  /// File path: assets/icons/call.png
  AssetGenImage get call => const AssetGenImage('assets/icons/call.png');

  /// File path: assets/icons/check.png
  AssetGenImage get check => const AssetGenImage('assets/icons/check.png');

  /// File path: assets/icons/error.png
  AssetGenImage get error => const AssetGenImage('assets/icons/error.png');

  /// File path: assets/icons/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/icons/location.png');

  /// File path: assets/icons/menu.png
  AssetGenImage get menu => const AssetGenImage('assets/icons/menu.png');

  /// File path: assets/icons/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/icons/notification.png');

  /// File path: assets/icons/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/icons/profile.png');

  /// File path: assets/icons/status_assign.png
  AssetGenImage get statusAssign =>
      const AssetGenImage('assets/icons/status_assign.png');

  /// File path: assets/icons/status_completed.png
  AssetGenImage get statusCompleted =>
      const AssetGenImage('assets/icons/status_completed.png');

  /// File path: assets/icons/status_ongoing.png
  AssetGenImage get statusOngoing =>
      const AssetGenImage('assets/icons/status_ongoing.png');

  /// File path: assets/icons/status_overdue.png
  AssetGenImage get statusOverdue =>
      const AssetGenImage('assets/icons/status_overdue.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    arrowLeft,
    byCycle,
    call,
    check,
    error,
    location,
    menu,
    notification,
    profile,
    statusAssign,
    statusCompleted,
    statusOngoing,
    statusOverdue,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/default_user.jpeg
  AssetGenImage get defaultUser =>
      const AssetGenImage('assets/images/default_user.jpeg');

  /// File path: assets/images/empty.png
  AssetGenImage get empty => const AssetGenImage('assets/images/empty.png');

  /// File path: assets/images/no_image_view.png
  AssetGenImage get noImageView =>
      const AssetGenImage('assets/images/no_image_view.png');

  /// File path: assets/images/spinner.gif
  AssetGenImage get spinner => const AssetGenImage('assets/images/spinner.gif');

  /// File path: assets/images/welcome_im.png
  AssetGenImage get welcomeIm =>
      const AssetGenImage('assets/images/welcome_im.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appLogo,
    defaultUser,
    empty,
    noImageView,
    spinner,
    welcomeIm,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
