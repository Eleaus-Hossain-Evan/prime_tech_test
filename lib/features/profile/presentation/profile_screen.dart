import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/core.dart';
import '../../auth/application/auth_provider.dart';
import 'widgets/picture_pic_widget.dart';
import 'widgets/profile_option_item.dart';

class ProfileScreen extends HookConsumerWidget {
  static const route = '/profile';

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final homeState = ref.watch(homeProvider);
    // final localState = ref.watch(appLocalProvider);
    // final isLoggedIn = ref.watch(loggedInProvider).loggedIn;

    //. -- Refresh Controller --
    final refreshController =
        useRef(RefreshController(initialLoadStatus: LoadStatus.canLoading));

    return Scaffold(
      appBar: KAppBar(titleText: AppStrings.profile),
      body: SmartRefresher(
        controller: refreshController.value,
        onRefresh: () => ref
            .refresh(authProvider.notifier)
            .profileView()
            .then((_) => refreshController.value.refreshCompleted()),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(44.h),
              //.  --- profile detail section ---
              const ProfilePicWidget(),

              gap24,
              const ProfileOptionsItem(
                leading: Images.iconUserIcon,
                title: "My Account",
              ),
              const KDivider(
                thickness: 2,
                color: AppColors.black200,
                height: 6,
              ),
              const ProfileOptionsItem(
                leading: Images.iconFileIcon,
                leadingSize: 18,
                leadingTitleGap: 10,
                title: "Notification",
              ),
              const KDivider(
                thickness: 2,
                color: AppColors.black200,
                height: 6,
              ),
              const ProfileOptionsItem(
                leading: Images.iconSettingsIcon,
                title: "Settings",
              ),
              const KDivider(
                thickness: 2,
                color: AppColors.black200,
                height: 6,
              ),
              const ProfileOptionsItem(
                leading: Images.iconChatHelp,
                leadingSize: 22,
                leadingTitleGap: 6,
                title: "Help Center",
              ),
              const KDivider(
                thickness: 2,
                color: AppColors.black200,
                height: 6,
              ),
              ProfileOptionsItem(
                leading: Images.iconLogoutIcon,
                title: AppStrings.logout,
                trailing: const SizedBox.shrink(),
                onTap: () => kShowFloatBottomSheet(
                  context: context,
                  child: _LogoutDialog(
                    onYesPressed: () async {
                      await ref.read(authProvider.notifier).logout();
                      // context.go(LoginScreen.route);
                    },
                    onNoPressed: () {},
                  ),
                ),
              ),
              gap18,
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Padding(
              //     padding: paddingLeft10,
              //     child: Text(
              //       AppStrings.support,
              //       style: CustomTextStyles.s16w600Black900,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoutDialog extends HookConsumerWidget {
  const _LogoutDialog({required this.onYesPressed, required this.onNoPressed});

  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: mainMin,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Text(
            AppStrings.logout,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Are you sure you want to logout?",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  // fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: .3.sw,
                  child: KFilledButton(
                    text: "Cancel",
                    onPressed: () {
                      Navigator.pop(context);
                      onNoPressed.call();
                    },
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    // foregroundColor:
                    //     Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                SizedBox(
                  width: .3.sw,
                  child: KFilledButton(
                    text: "Yes",
                    onPressed: () {
                      Navigator.pop(context);
                      onYesPressed.call();
                      // context.go(LoginScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
