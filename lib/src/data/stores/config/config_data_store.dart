abstract class ConfigDataStore {
  Future<String> getApiServerUrl();

  Future<String> getClientId();

  Future<String> getClientSecret();

  Future<int> getDoorId();
}
