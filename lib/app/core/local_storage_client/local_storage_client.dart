abstract class ILocalStorageClient {
  Future<String> getString(String key);
  Future<bool> setString(String key, String value);

  Future<bool> setListString(String key, List<String> value);
  Future<List<String>> getListString(String key);
}
