import 'package:domain/entities/user_configs.dart';
import 'package:equatable/equatable.dart';

class UserConfigsState extends Equatable {
  const UserConfigsState({
    this.configs,
  });

  final UserConfigs? configs;

  @override
  List<Object?> get props => [configs];
}
