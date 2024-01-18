import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core.dart';

class KCachedNetworkImageNoBase extends StatelessWidget {
  const KCachedNetworkImageNoBase(
      {super.key,
      required this.imageUrl,
      this.borderRadius = const BorderRadius.all(Radius.zero),
      this.height = 200,
      this.width = double.infinity,
      this.borderWidth,
      this.fit = BoxFit.cover,
      this.child,
      this.padding,
      this.margin,
      this.borderColor});

  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final double? height, width, borderWidth;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          padding: padding,
          margin: margin,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1.w,
            ),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        );
      },
      height: height,
      width: width,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: SizedBox(
          height: 30.h,
          width: 30.h,
          child: CircularProgressIndicator(
            value: progress.progress,
            strokeWidth: .8.w,
          ),
        ),
      ),
      errorWidget: (context, url, error) {
        log(url.toString(), error: error);
        return const Icon(Icons.error);
      },
      // placeholder: (context, url) => const Icon(Icons.error),
    );
  }
}

class KCachedNetworkImageWdLoading extends StatelessWidget {
  const KCachedNetworkImageWdLoading({
    super.key,
    required this.imageUrl,
    this.borderRadius,
    this.height,
    this.width,
    this.borderWidth,
    this.fit = BoxFit.cover,
    this.child,
    this.padding,
    this.margin,
    this.borderColor,
    this.isBox = false,
    this.isHero = true,
  });

  final String imageUrl;
  final BorderRadius? borderRadius;
  final BoxFit? fit;
  final double? height, width, borderWidth;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final Color? borderColor;
  final bool isBox, isHero;

  @override
  Widget build(BuildContext context) {
    var isContainer = isBox
        ? (borderWidth != null && borderColor != null && borderRadius != null)
        : false;
    return Hero(
      tag: isHero ? ValueKey(imageUrl) : UniqueKey(),
      child: CachedNetworkImage(
        imageUrl: APIRouteEndpoint.IMAGE_BASE_URL +
            APIRouteEndpoint.PRODUCT_IMAGE +
            imageUrl,
        fit: fit,
        imageBuilder: isContainer
            ? (context, imageProvider) {
                return Container(
                  width: width,
                  height: height,
                  padding: padding,
                  margin: margin,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    border: Border.all(
                      color: borderColor ?? Colors.transparent,
                      width: borderWidth ?? 1.w,
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: child,
                );
              }
            : null,
        height: height,
        width: width,
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                value: progress.progress,
                strokeWidth: .8.w,
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        // placeholder: (context, url) => const Icon(Icons.error),
      ),
    );
  }
}

class KCachedNetworkImage extends StatelessWidget {
  const KCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final BoxFit? fit;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: ValueKey(imageUrl),
      child: CachedNetworkImage(
        imageUrl:
            "${APIRouteEndpoint.IMAGE_BASE_URL}${APIRouteEndpoint.PRODUCT_IMAGE}$imageUrl",
        fit: fit,
        height: height,
        width: width,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: SizedBox(
              height: 30.h,
              width: 30.h,
              child: CircularProgressIndicator(
                value: progress.progress,
                strokeWidth: .8.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
