import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';
import '../../../auth/application/auth_provider.dart';

class ProfilePicWidget extends HookConsumerWidget {
  const ProfilePicWidget({
    super.key,
    this.onEditTap,
  });

  final Function()? onEditTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);

    return KInkWell(
      onTap: onEditTap ?? () {},
      borderRadius: radius8,
      child: Column(
        children: [
          KUserAvatar(
            radius: 42.w,
            enableBorder: true,
            isHero: false,
          ),
          gap12,
          Column(
            crossAxisAlignment: crossCenter,
            children: [
              Text(
                state.user.name,
                style: CustomTextStyles.s16w600,
              ),
              Visibility(
                visible: state.user.email.isNotEmpty,
                child: Text(
                  state.user.email,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.s14w400Black800,
                ).pOnly(top: 4.h),
              ),
              gap4,
              Text(
                state.user.phone,
                style: CustomTextStyles.s14w400Black800,
              ),
            ],
          ),
        ],
      ).p20(),
    ).box.color(AppColors.bg100).roundedSM.make();
  }
}
