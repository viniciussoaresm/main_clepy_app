import 'package:clepy_caches/repositories/user_configs_repository_interface.dart';
import 'package:domain/domain.dart';

class SetUserConfigs {
  final IUserConfigRepository userConfigRepository;

  SetUserConfigs({required this.userConfigRepository});

  Future<void> call(UserConfigs userConfigs) async {
    return await userConfigRepository.setConfigs(userConfigs);
  }
}
