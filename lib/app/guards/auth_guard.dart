import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth');

  @override
  bool canActivate(String path, ModularRoute router) {
    return FirebaseAuth.instance.currentUser != null;
  }
}
