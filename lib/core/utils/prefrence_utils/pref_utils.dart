import 'package:kublet/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString(AppConstants.themeData, value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString(AppConstants.themeData)!;
    } catch (e) {
      return 'primary';
    }
  }

  Future<void> setCurrentDeviceId(int id) {
    return _sharedPreferences!.setInt(AppConstants.currentDeviceId, id);
  }

  int? getCurrentDeviceId() {
    try {
      return _sharedPreferences!.getInt(AppConstants.currentDeviceId)!;
    } catch (e) {
      return null;
    }
  }
}
