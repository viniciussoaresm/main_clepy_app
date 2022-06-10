import 'package:clepy/app/shared/blocs/user_config/user_configs_state.dart';
import 'package:clepy_caches/clepy_caches.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserConfigsCubit extends Cubit<UserConfigsState> {
  UserConfigsCubit({
    required this.getUserConfigs,
    required this.setUserConfigs,
  }) : super(const UserConfigsState());

  final GetUserConfigs getUserConfigs;
  final SetUserConfigs setUserConfigs;

  void loadUserConfig() async {
    UserConfigs userConfigs = await getUserConfigs();
    ClepyUser? userData = await LoginService().retrieverUser();

    emit(
      UserConfigsState(
        configs: userConfigs,
        userData: userData,
        user: FirebaseAuth.instance.currentUser,
      ),
    );
  }
}
