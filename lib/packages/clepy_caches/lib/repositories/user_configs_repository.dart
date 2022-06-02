import 'dart:convert';

import 'package:domain/entities/user_configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_configs_repository_interface.dart';

class UserConfigRepository implements IUserConfigRepository {
  @override
  Future<UserConfigs> loadConfigs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // await sharedPreferences.clear();

    UserConfigs configs = UserConfigs(showOnboarding: true);

    try {
      String? userConfigs = sharedPreferences.getString('user_configs');

      if (userConfigs != null) {
        dynamic data = await jsonDecode(userConfigs);
        configs = UserConfigs.fromMap(data);
      }
    } catch (_) {
      print('Erro ao carregar informações do Usuario!');
    }

    return configs;
  }

  @override
  Future<void> setConfigs(UserConfigs userConfigs) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String json = jsonEncode(userConfigs.toMap());
    await sharedPreferences.setString('user_configs', json);
  }
}
