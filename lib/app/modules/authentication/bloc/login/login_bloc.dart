import 'package:clepy/app/modules/authentication/bloc/login/login_event.dart';
import 'package:clepy/app/modules/authentication/bloc/login/login_state.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;

  LoginBloc({required this.loginService}) : super(LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      if (event is DoLogin) {
        emit(
          LoginState.loading(),
        );

        await loginService.login(
          login: event.email,
          password: event.password,
        );

        Modular.to.pushReplacementNamed('/');
      } else if (event is LoginError) {
        emit(
          LoginState.error(
            mesageError: event.messageErro,
          ),
        );
      }
    });
  }
}
