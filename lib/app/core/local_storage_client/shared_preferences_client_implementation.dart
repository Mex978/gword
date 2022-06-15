import 'package:gword/app/core/local_storage_client/local_storage_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClientImplementation implements ILocalStorageClient {
  final SharedPreferences _prefs;

  SharedPreferencesClientImplementation(this._prefs);

  @override
  Future<String> getString(String key) async {
    return _prefs.getString(key) ?? '';
  }

  @override
  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }

  @override
  Future<List<String>> getListString(String key) async {
    return _prefs.getStringList(key) ?? [];
  }

  @override
  Future<bool> setListString(String key, List<String> value) {
    return _prefs.setStringList(key, value);
  }
}
