import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreference;
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  static init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  static Future<bool?> putBoolean(
      {@required String? key, @required bool? value}) async {
    return await sharedPreference?.setBool(key!, value!);
  }

  static bool? getBoolean({
    @required String? key,
  }) {
    return sharedPreference?.getBool(key!);
  }
}
