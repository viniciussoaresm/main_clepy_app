import 'package:domain/enums/clepy_type_user.dart';

abstract class ClepyUser {
  final String uid;
  final String name;
  final String email;
  final String cpf;
  final String birthday;
  final String telephone;
  final ClepyTypeUser clepyTypeUser;
  ClepyUser({
    required this.uid,
    required this.name,
    required this.clepyTypeUser,
    required this.email,
    required this.cpf,
    required this.birthday,
    required this.telephone,

  });
}
