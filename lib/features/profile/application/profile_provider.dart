import 'package:flutter_animate/flutter_animate.dart';
import 'package:prime_tech_test/features/profile/infrastructure/profile_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/user_model.dart';

final getUserInfoProvider = FutureProvider.autoDispose<UserModel>((ref) async {
  return await Future.delayed(
    2000.ms,
    () => ref.read(profileRepoProvider).getUserInfo(),
  );
});
