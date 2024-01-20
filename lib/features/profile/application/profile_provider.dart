import 'package:prime_tech_test/features/profile/infrastructure/profile_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/user_model.dart';

final getUserInfoProvider = FutureProvider.autoDispose<UserModel>((ref) async {
  return await ref.read(profileRepoProvider).getUserInfo();
});
