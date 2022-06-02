import 'package:clepy_caches/clepy_caches.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/blocs/user_configs_state.dart';

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

  // void setFirstAccess(bool firstAccess) async {
  //   try {
  //     UserConfigs userConfigs = await getUserConfigs();
  //     userConfigs.firstAccess = false;
  //     await setUserConfigs(userConfigs);
  //     emit(UserConfigsState(configs: userConfigs));
  //   } catch (_) {
  //     print('falha ao Salvar configuração!');
  //   }
  // }
}
