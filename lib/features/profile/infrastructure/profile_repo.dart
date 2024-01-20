import 'dart:convert';

import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:prime_tech_test/features/profile/domain/user_model.dart';

import '../../../core/core.dart';

final profileRepoProvider = Provider<ProfileRepo>((ref) {
  return ProfileRepo();
});

class ProfileRepo {
  final api = NetworkHandler.instance;

  Future<UserModel> getUserInfo() async {
    final uri =
        Uri.parse('${APIRouteEndpoint.BASE_URL}${APIRouteEndpoint.USER_INFO}');
    final response = await http.get(uri, headers: api.header(true));

    if (response.statusCode != 200) {
      Logger.e(response.body);
      throw Exception('Error fetching categories');
    }

    Logger.i(response.body);

    final Map<String, dynamic> body = json.decode(response.body);
    return UserModel.fromMap(body);
  }
}
