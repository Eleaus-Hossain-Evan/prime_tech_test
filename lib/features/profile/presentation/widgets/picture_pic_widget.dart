import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../../auth/application/auth_provider.dart';
import '../../application/profile_provider.dart';

class ProfilePicWidget extends HookConsumerWidget {
  const ProfilePicWidget({
    super.key,
    this.onEditTap,
  });

  final Function()? onEditTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    final profile = ref.watch(getUserInfoProvider);

    return KInkWell(
      onTap: onEditTap ?? () {},
      borderRadius: radius20,
      child: Column(
        children: [
          Row(
            children: [
              profile.maybeWhen(
                data: (data) => KUserAvatar(
                  radius: 42.w,
                  enableBorder: true,
                  isHero: false,
                  imageUrl: data.avatar,
                ),
                orElse: () => KSkeletonWidget(
                  height: 84.w,
                  width: 84.w,
                  shape: BoxShape.circle,
                ),
              ),
              gap4,
              Expanded(
                child: profile.when(
                  data: (data) => Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      Text(
                        data.name,
                        style: CustomTextStyles.s16w600,
                      ),
                      Text(
                        data.email,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.s14w400Black800,
                      ).pOnly(top: 4.h),
                    ],
                  ),
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      KSkeletonWidget(
                        height: 18,
                        margin: 100.w.paddingEnd,
                      ),
                      gap8,
                      KSkeletonWidget(
                        height: 14,
                        margin: 20.w.paddingEnd,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          gap12,
          KFilledButton(
            onPressed: () {},
            text: "Edit Account",
            backgroundColor: AppColors.primary300,
          ),
        ],
      ).p20(),
    ).box.color(AppColors.bg100).withRounded(value: 20.r).withShadow([
      BoxShadow(
        color: const Color(0xFF111111).withOpacity(.04),
        blurRadius: 15,
        spreadRadius: 10,
      )
    ]).make();
  }
}
