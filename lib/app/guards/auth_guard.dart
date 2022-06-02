import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth');

  @override
  Future<bool> canActivate(String path, ModularRoute router) {
    return Future.delayed(const Duration(seconds: 1)).then((value) => true);
  }
}
