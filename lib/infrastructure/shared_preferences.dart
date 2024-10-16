import 'package:shared_preferences/shared_preferences.dart';

enum Keys {
  isFirstTime,
  isLogged,
  token,
  languageCode,
  darkMode,
}

class SharedPrefController {
  late SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setData(Keys key, var value) async {
    if (value is String) return await _sharedPreferences.setString(key.name, value);
    if (value is int) return await _sharedPreferences.setInt(key.name, value);
    if (value is bool) return await _sharedPreferences.setBool(key.name, value);
    if (value is double) return await _sharedPreferences.setDouble(key.name, value);
    return false;
  }

  dynamic getData({required Keys key,}) {
    return _sharedPreferences.get(key.name);
  }

  dynamic removeData({required Keys key,}) {
    return _sharedPreferences.remove(key.name);
  }

  bool isTokenNull() {
    String? token = _sharedPreferences.getString(Keys.token.name);
    return token == null || token.trim().isEmpty;
  }

  Future<bool> clearAllData() async {
    return await _sharedPreferences.clear();
  }
}
