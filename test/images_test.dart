import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:prime_tech_test/core/utils/assets/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.iconFileIcon).existsSync(), isTrue);
    expect(File(Images.iconHeart).existsSync(), isTrue);
    expect(File(Images.iconLogoutIcon).existsSync(), isTrue);
    expect(File(Images.iconProfile).existsSync(), isTrue);
    expect(File(Images.iconSearch).existsSync(), isTrue);
    expect(File(Images.iconSettingsIcon).existsSync(), isTrue);
    expect(File(Images.iconUserIcon).existsSync(), isTrue);
    expect(File(Images.iconChatHelp).existsSync(), isTrue);
    expect(File(Images.iconFacebook2).existsSync(), isTrue);
    expect(File(Images.iconGoogleIcon).existsSync(), isTrue);
    expect(File(Images.iconTwitter3).existsSync(), isTrue);
    expect(File(Images.svgSettings).existsSync(), isTrue);
  });
}
