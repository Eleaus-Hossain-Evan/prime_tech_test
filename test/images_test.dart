import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:prime_tech_test/core/utils/assets/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.iconHeart).existsSync(), isTrue);
    expect(File(Images.iconProfile).existsSync(), isTrue);
    expect(File(Images.iconSearch).existsSync(), isTrue);
    expect(File(Images.iconFacebook2).existsSync(), isTrue);
    expect(File(Images.iconGoogleIcon).existsSync(), isTrue);
    expect(File(Images.iconTwitter3).existsSync(), isTrue);
  });
}
