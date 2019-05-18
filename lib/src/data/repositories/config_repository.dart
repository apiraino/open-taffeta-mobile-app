/// Interface for all configuration repositories
abstract class ConfigRepository {
  Future<String> getServerUrl();

  Future<String> getClientId();

  Future<String> getClientSecret();
}
