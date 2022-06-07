import 'package:domain/enums/clepy_type_user.dart';

abstract class ClepyUser {
  final String uid;
  final String name;
  final String email;
  final ClepyTypeUser clepyTypeUser;
  ClepyUser({
    required this.uid,
    required this.name,
    required this.clepyTypeUser,
    required this.email,
  });
}
