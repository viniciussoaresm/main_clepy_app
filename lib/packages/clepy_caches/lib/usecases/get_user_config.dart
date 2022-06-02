import 'package:clepy_caches/repositories/user_configs_repository.dart';
import 'package:clepy_caches/repositories/user_configs_repository_interface.dart';
import 'package:domain/domain.dart';

class GetUserConfigs {
  final IUserConfigRepository userConfigRepository;

  GetUserConfigs({required this.userConfigRepository});

  Future<UserConfigs> call() async {
    return await userConfigRepository.loadConfigs();
  }
}
