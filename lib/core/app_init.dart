import 'package:hive_flutter/adapters.dart';

import 'constants.dart';

class AppInit {
  static Box? _hiveSettingBox;

  static Future init() async {
    await Hive.initFlutter();

    await Hive.openBox(boxSettings);
  }

  static Box get hiveSettingBox {
    _hiveSettingBox ??= Hive.box(boxSettings);
    return _hiveSettingBox!;
  }

  static void clearHive() {
    hiveSettingBox.clear();
  }
}
