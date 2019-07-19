/// Domain layer's interface for the configuration repositories
abstract class ConfigRepository {
  Future<String> getApiServerUrl();

  Future<String> getClientId();

  Future<String> getClientSecret();

  Future<int> getDoorId();
}
