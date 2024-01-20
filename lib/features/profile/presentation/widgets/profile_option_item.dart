import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/core.dart';

class ProfileOptionsItem extends HookConsumerWidget {
  const ProfileOptionsItem({
    super.key,
    required this.leading,
    required this.title,
    this.leadingSize = 24,
    this.leadingPadding = EdgeInsets.zero,
    this.leadingTitleGap = 4,
    this.visible = true,
    this.trailingText,
    this.onTap,
    this.trailing,
    this.secondaryTrailing,
  });

  final String leading;
  final double leadingSize;
  final EdgeInsetsGeometry leadingPadding;
  final String title;
  final double leadingTitleGap;
  final bool visible;
  final String? trailingText;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? secondaryTrailing;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: visible,
      child: KInkWell(
        onTap: onTap,
        borderRadius: radius10,
        child: SizedBox(
          height: 44,
          child: Row(
            children: [
              Padding(
                padding: leadingPadding,
                child: leading.assetImage(
                  width: leadingSize,
                  height: leadingSize,
                  color: context.colors.primary,
                ),
              ),
              Gap(leadingTitleGap.w),
              Expanded(
                child: Text(
                  title,
                  style: CustomTextStyles.s14w,
                ),
              ),
              trailing ??
                  (secondaryTrailing ??
                      (trailingText == null
                          ? const SizedBox.shrink()
                          : Text(
                              trailingText ?? "",
                              style: CustomTextStyles.s14w500Red,
                            ))),
              gap12,
              trailing == null
                  ? Icon(
                      Icons.chevron_right_rounded,
                      size: 28.sp,
                      color: AppColors.black600,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
