import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_ecommerce_delivery_app/generated/assets.gen.dart';

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, network, file, unknown }

class CustomImageView extends StatelessWidget {
  const CustomImageView({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.color,
    this.icon,
    this.fit,
    this.placeHolder = '',
    this.alignment,
    this.onTap,
    this.margin,
    this.radius,
    this.border,
    this.s3Key,
  });

  final String? imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final String placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;
  final IconData? icon;
  final String? s3Key;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      key: key,
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(onTap: onTap, child: _buildCircleImage()),
    );
  }

  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(border: border, borderRadius: radius),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (icon != null) {
      // If an icon is provided, display it
      return Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: height ?? 24.0, // Default size if height is not provided
          color: color ?? Colors.black, // Default color if not provided
        ),
      );
    }
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svg:
          return SizedBox(
            key: key,
            height: height,
            width: width,
            child: SvgPicture.asset(
              imagePath!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: color != null
                  ? ColorFilter.mode(
                      color ?? Colors.transparent,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
          );
        case ImageType.file:
          return Image.file(
            File(imagePath!),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        case ImageType.network:
          return FutureBuilder(
            future: Future.value(imagePath!),
            //for s3 check
            // future: s3Key != null
            //     ? s3ImageChecker(imagePath!, s3Key: s3Key!)
            //     : Future.value(imagePath!),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return CachedNetworkImage(
                  height: height,
                  width: width,
                  fit: fit,
                  imageUrl: snapshot.data!,
                  color: color,
                  placeholder: (context, url) => SizedBox(
                    height: 30,
                    width: 30,
                    child: LinearProgressIndicator(
                      color: Colors.grey.shade200,
                      backgroundColor: Colors.grey.shade100,
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return CustomImageView(
                      imagePath: Assets.images.noImageView.path,
                      height: height,
                      width: width,
                      fit: fit,
                    );
                  },
                );
              } else {
                return CustomImageView(
                  imagePath: Assets.images.noImageView.path,
                  height: height,
                  width: width,
                  fit: fit,
                );
              }
            },
          );

        case ImageType.png:
        default:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                Assets.images.noImageView.path,
                height: height,
                width: width,
                fit: fit ?? BoxFit.cover,
                color: color,
              );
            },
          );
      }
    }
    return const SizedBox();
  }
}
