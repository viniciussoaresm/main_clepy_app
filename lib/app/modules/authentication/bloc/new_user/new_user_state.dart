import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class NewUserState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewUserStateInitial extends NewUserState {}

class NewUserStateError extends NewUserState {
  final ClepyUser user;
  final String mesageError;
  NewUserStateError({
    required this.user,
    required this.mesageError,
  });
}

class NewUserStateErrorConfirm extends NewUserState {
  NewUserStateErrorConfirm();
}

class NewUserStateLoading extends NewUserState {}
