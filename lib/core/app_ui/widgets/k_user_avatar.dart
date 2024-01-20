import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../features/auth/application/auth_provider.dart';
import '../../core.dart';

class KUserAvatar extends HookConsumerWidget {
  const KUserAvatar({
    super.key,
    this.radius = 20,
    required this.enableBorder,
    this.isHero = true,
    this.onTap,
    this.icon,
    this.bgColor,
    this.imageFile,
    this.imageUrl,
  });

  final double radius;
  final bool enableBorder;
  final bool isHero;
  final VoidCallback? onTap;
  final Widget? icon;
  final Color? bgColor;
  final File? imageFile;
  final String? imageUrl;

  @override
  Widget build(BuildContext context, ref) {
    final isEmptyUrl =
        imageUrl.isEmptyOrNull && ref.watch(authProvider).user.avatar.isEmpty;
    final url = imageUrl ?? ref.watch(authProvider).user.avatar;
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius + 1),
      child: KInkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.w),
        padding: EdgeInsets.all(4.w),
        child: Hero(
          tag: !isEmptyUrl && isHero ? url : UniqueKey(),
          child: CircleAvatar(
            radius: enableBorder ? radius + 1 : radius - 1,
            backgroundColor: bgColor ?? context.colors.secondary,
            child: CircleAvatar(
              radius: radius,
              backgroundColor:
                  bgColor ?? Theme.of(context).colorScheme.background,
              backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
              child: imageFile == null
                  ? isEmptyUrl
                      ? icon ??
                          Icon(
                            EvaIcons.person_outline,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                      : KCachedNetworkImageNoBase(
                          imageUrl: url,
                          borderRadius: BorderRadius.circular(radius),
                        )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
