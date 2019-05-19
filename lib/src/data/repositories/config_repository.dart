/// Interface for all configuration repositories
/// Mostly only one local repository
abstract class ConfigRepository {
  Future<String> getApiServerUrl();

  Future<String> getClientId();

  Future<String> getClientSecret();
}
