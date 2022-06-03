import 'package:domain/entities/user_configs.dart';

abstract class IUserConfigRepository {
  Future<UserConfigs> loadConfigs();
  Future<void> setConfigs(UserConfigs userConfigs);
}
