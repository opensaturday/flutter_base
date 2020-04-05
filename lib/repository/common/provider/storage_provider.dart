abstract class StorageProvider {
  Future<bool> setMap(String key, Map<String, dynamic> value);

  Future<bool> setString(String key, String value);

  Future<Map<String, dynamic>> getMap(String key);

  Future<String> getString(String key);
}
