import 'package:clepy/app/modules/authentication/bloc/login/login_bloc.dart';
import 'package:clepy/app/modules/authentication/screens/login_screen.dart';
import 'package:clepy/app/modules/authentication/screens/new_user_screen.dart';
import 'package:domain/service/login_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory(
      (i) => LoginService(),
    ),
    Bind.factory(
      (i) => LoginBloc(
        loginService: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const LoginScreen(),
    ),
    ChildRoute(
      '/signup',
      child: (context, args) => NewUserScreen(),
    ),
  ];
}
