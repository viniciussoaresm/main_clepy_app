import 'package:clepy/app/enums/route_names.dart';
import 'package:clepy/app/modules/authentication/screens/login_screen.dart';
import 'package:clepy/app/modules/authentication/screens/new_user_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => LoginScreen(),
    ),
    ChildRoute(
      '/signup',
      child: (context, args) => NewUserScreen(),
    ),
  ];
}
