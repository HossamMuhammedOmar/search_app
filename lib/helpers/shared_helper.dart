import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPreferences;

  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> cacheData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return sharedPreferences!.setString(key, value);
    if (value is bool) return sharedPreferences!.setBool(key, value);
    if (value is double) return sharedPreferences!.setDouble(key, value);
    return sharedPreferences!.setInt(key, value);
  }

  static dynamic getCacheData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeCacheData({required key}) async {
    return await sharedPreferences!.remove(key);
  }
}
