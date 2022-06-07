import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState(
      {required this.isError, required this.isLoading, this.mesageError});

  factory LoginState.initial() {
    return const LoginState(
      isError: false,
      isLoading: false,
    );
  }

  factory LoginState.error({required String mesageError}) {
    return LoginState(
      isError: true,
      isLoading: false,
      mesageError: mesageError,
    );
  }

  factory LoginState.loading() {
    return const LoginState(
      isLoading: true,
      isError: false,
    );
  }

  final bool isLoading;
  final bool isError;
  final String? mesageError;

  @override
  List<Object> get props => [isLoading, isError];
}
