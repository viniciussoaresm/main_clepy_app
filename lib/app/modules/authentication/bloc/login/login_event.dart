import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DoLogin extends LoginEvent {
  final String email;
  final String password;
  DoLogin({
    required this.email,
    required this.password,
  });
}

class LoginError extends LoginEvent {
  final String messageErro;
  LoginError({
    required this.messageErro,
  });
}
