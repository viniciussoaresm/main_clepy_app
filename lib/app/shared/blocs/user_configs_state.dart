import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserConfigsState extends Equatable {
  const UserConfigsState({
    this.configs,
    this.userData,
    this.user,
  });

  final UserConfigs? configs;
  final ClepyUser? userData;
  final User? user;

  get isLoged => user != null;

  @override
  List<Object?> get props => [
        configs,
        userData,
        user,
      ];
}
