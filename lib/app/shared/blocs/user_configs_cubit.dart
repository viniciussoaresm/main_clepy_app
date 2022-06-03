import 'package:clepy_caches/clepy_caches.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_configs_state.dart';

class UserConfigsCubit extends Cubit<UserConfigsState> {
  UserConfigsCubit({
    required this.getUserConfigs,
    required this.setUserConfigs,
  }) : super(const UserConfigsState());

  final GetUserConfigs getUserConfigs;
  final SetUserConfigs setUserConfigs;

  void loadUserConfig() async {
    UserConfigs userConfigs = await getUserConfigs();
    emit(UserConfigsState(configs: userConfigs));
  }
}
