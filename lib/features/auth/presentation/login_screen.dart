import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../application/auth_provider.dart';

class LoginScreen extends HookConsumerWidget {
  static const route = '/login';

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey.new);
    final emailController = useTextEditingController(text: "ptls@gmail.com");
    final passwordController = useTextEditingController(text: "123456");
    final phoneFocus = useFocusScopeNode();
    final passwordFocus = useFocusScopeNode();
    final rememberMe = useState(false);

    ref.listen(
      authProvider,
      (previous, next) {
        if (previous!.loading == true && next.loading == false) {
          BotToast.closeAllLoading();
        } else {
          BotToast.showLoading();
        }
      },
    );

    useEffect(() {
      return () {
        BotToast.closeAllLoading();
      };
    }, const []);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: crossCenter,
              children: [
                Gap(62.h),

                AppStrings.loginTitle.text
                    .textStyle(ContentTextStyle.headline5)
                    .fontWeight(AppFontWeight.semiBold)
                    .make(),
                Gap(15.h),

                Padding(
                  padding: 55.paddingHorizontal,
                  child: AppStrings.loginSubTitle.text
                      .textStyle(ContentTextStyle.bodyText2)
                      .center
                      .make(),
                ),

                Gap(52.h),

                //. Login Form

                //. email Number
                AppStrings.email.text
                    .textStyle(ContentTextStyle.bodyText2)
                    .bold
                    .base
                    .make()
                    .objectCenterLeft(),
                gap4,
                KTextFormField2(
                  containerPadding: padding0,
                  controller: emailController,
                  focusNode: phoneFocus,
                  keyboardType: TextInputType.text,
                  hintText: AppStrings.emailHint,
                ),
                gap16,

                //. Password
                AppStrings.password.text
                    .textStyle(ContentTextStyle.bodyText2)
                    .bold
                    .base
                    .make()
                    .objectCenterLeft(),
                gap4,
                KTextFormField2(
                  containerPadding: padding0,
                  controller: passwordController,
                  focusNode: passwordFocus,
                  keyboardType: TextInputType.text,
                  hintText: AppStrings.password,
                  isObscure: true,
                ),
                gap16,
                Row(
                  mainAxisAlignment: mainEnd,
                  children: [
                    KInkWell(
                      onTap: () {},
                      child: AppStrings.forgotPassword.text
                          .textStyle(ContentTextStyle.bodyText2)
                          .bold
                          .base
                          .make()
                          .objectCenterLeft(),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: mainEnd,
                        children: [
                          FittedBox(
                            child: Checkbox(
                              value: rememberMe.value,
                              onChanged: (v) {
                                rememberMe.value = v!;
                              },
                            ),
                          ),
                          gap14,
                          KInkWell(
                            onTap: () {},
                            child: AppStrings.rememberMe.text
                                .textStyle(ContentTextStyle.bodyText2)
                                .bold
                                .base
                                .make()
                                .objectCenterLeft(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                gap24,

                //. Login Button
                KGradientButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    ref.read(authProvider.notifier).login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  },
                  text: AppStrings.signIn,
                ),

                gap16,

                KOutlinedButton(
                  onPressed: () {},
                  text: AppStrings.signinwithMobileNumber,
                ),

                //. going to sign up page
                Row(
                  mainAxisAlignment: mainCenter,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppStrings.dontHaveAccount,
                      ),
                    ),
                    gap2,
                    KTextButton(
                      isSecondary: false,
                      onPressed: () {},
                      text: AppStrings.signUp,
                    ).w(80),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
