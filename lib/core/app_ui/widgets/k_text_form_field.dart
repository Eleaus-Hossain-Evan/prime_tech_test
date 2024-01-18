import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../core.dart';

class KTextFormField extends HookConsumerWidget {
  const KTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    required TextEditingController controller,
    this.isObscure = false,
    this.readOnly = false,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor = Colors.transparent,
    this.fillColor = AppColors.white,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.onTap,
    this.textInputAction,
    this.maxLines = 1,
    this.hintStyle,
    this.labelStyle,
    this.contentPadding,
  }) : _controller = controller;

  final String? hintText;
  final String? labelText;
  final TextEditingController _controller;
  final bool isObscure, readOnly;
  final FocusNode? focusNode;
  final BorderRadius? borderRadius;
  final Widget? prefixIcon, suffixIcon;
  final Color? fillColor;
  final Color borderColor;
  final TextInputType keyboardType;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Function()? onEditingComplete, onTap;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context, ref) {
    final hideText = useState(true);

    final border = OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(4.r)),
      borderSide: BorderSide(color: borderColor),
    );
    return TextFormField(
      controller: _controller,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      maxLines: maxLines,
      style: GoogleFonts.openSans(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: AppColors.black,
        letterSpacing: 1.2,
      ),
      obscureText: isObscure ? hideText.value : false,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: onSaved,
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        errorBorder: border,
        disabledBorder: border,
        isDense: true,
        filled: true,
        fillColor: fillColor,
        // contentPadding: EdgeInsets.symmetric(
        //   horizontal: 12.w,
        //   vertical: 6.h,
        // ),
        hintText: hintText,
        labelText: labelText,
        hintStyle: hintStyle ??
            GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
        labelStyle: labelStyle ??
            GoogleFonts.openSans(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
        prefixIcon: prefixIcon,
        // suffix: suffixIcon,
        suffixIcon: suffixIcon ??
            (isObscure
                ? KInkWell(
                    borderRadius: radius12,
                    onTap: () {
                      hideText.value = !hideText.value;
                    },
                    child: hideText.value
                        ? Container(
                            height: 4.w,
                            width: 4.w,
                            padding: EdgeInsets.all(18.w),
                            decoration: const BoxDecoration(
                                // image: DecorationImage(
                                //   image: AssetImage(
                                //     'assets/cross_eye.png',
                                //   ),
                                //   fit: BoxFit.fitWidth,
                                // ),
                                // color: Colors.amber,
                                ),
                            child: Image.asset(
                              'assets/cross_eye.png',
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        : Icon(
                            Icons.remove_red_eye,
                            size: 20.sp,
                            color: Theme.of(context).primaryColorLight,
                          ),
                  )
                : null),
      ),
    );
  }
}

class KTextFormField2 extends HookConsumerWidget {
  const KTextFormField2({
    super.key,
    this.controller,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.suffixIcon,
    this.readOnly = false,
    this.isLabel = false,
    this.enabled = true,
    this.onTap,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.maxLines = 1,
    this.contentPadding =
        const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
    this.containerPadding,
    this.fillColor = AppColors.bg100,
    this.borderColor = AppColors.primary,
    this.hintTextStyle,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final TextAlign textAlign;
  final Widget? suffixIcon;
  final bool readOnly, isLabel, enabled;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool isObscure;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged, onFieldSubmitted;
  final int? maxLines;
  final EdgeInsets? contentPadding, containerPadding;
  final Color fillColor, borderColor;
  final TextStyle? hintTextStyle;
  final bool autofocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideText = useState(true);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(
        color: AppColors.transparent,
        width: 1,
      ),
    );
    return TextFormField(
      obscureText: isObscure ? hideText.value : false,
      obscuringCharacter: '*',
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // style: CustomTextStyle.textStyle14w400B900,
      textAlign: textAlign,
      keyboardType: keyboardType,
      maxLines: maxLines,
      autofocus: autofocus,
      decoration: InputDecoration(
        hintText: isLabel ? null : hintText,
        hintStyle: hintTextStyle,
        labelText: isLabel ? hintText : null,
        // labelStyle: enabled
        //     ? CustomTextStyle.textStyle12w400B800
        //     : CustomTextStyle.textStyle14w400B800,
        contentPadding: contentPadding,
        fillColor: fillColor,
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        disabledBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        filled: true,
        prefixIcon: prefixIcon,

        suffixIcon: suffixIcon ??
            (isObscure
                ? KInkWell(
                    borderRadius: radius24,
                    onTap: () {
                      hideText.value = !hideText.value;
                    },
                    child: hideText.value
                        ? const Icon(EvaIcons.eye_off_2_outline)
                        : const Icon(EvaIcons.eye),
                  )
                : null),
      ),
      onTap: onTap,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

class KTextFormField3 extends HookConsumerWidget {
  const KTextFormField3({
    super.key,
    this.controller,
    this.validator,
    this.focusNode,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isObscure;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged, onFieldSubmitted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const border = InputBorder.none;
    return TextFormField(
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        border: border,
        focusedBorder: const UnderlineInputBorder(
            // borderSide: BorderSide(color: ColorPalate.harrisonGrey600),
            ),
        enabledBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        errorBorder: border,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 0.h,
        ),
        isDense: true,
        filled: true,
        fillColor: Colors.transparent,
      ),
      textInputAction: textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
