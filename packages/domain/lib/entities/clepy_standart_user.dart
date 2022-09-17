import 'package:domain/enums/clepy_type_user.dart';

import 'clepy_rent.dart';
import 'clepy_user.dart';

class ClepyStandartUser extends ClepyUser {
  ClepyStandartUser({
    required String uid,
    required String name,
    required String email,
    required String cpf,
    required String birthday,
    required String telephone,
    required this.keyWords,
    required this.urlProfilePicture,
    this.rests,
  }) : super(
          uid: uid,
          name: name,
          cpf: cpf,
          birthday: birthday,
          telephone: telephone,
          clepyTypeUser: ClepyTypeUser.standart,
          email: email,
        );

  final List<String> keyWords;
  final String urlProfilePicture;
  List<ClepyRent>? rests;

  factory ClepyStandartUser.fromMap(Map<String, dynamic> data) {
    List<ClepyRent> rents = [];

    if (data['rents'] != null) {
      data['rents'].forEach((product) {
        rents.add(ClepyRent.fromMap(product));
      });
    }

    List<String> keyWords = [];

    if (data['keyWords'] != null) {
      data['keyWords'].forEach((keyword) {
        keyWords.add(keyword);
      });
    }

    return ClepyStandartUser(
      uid: data['uid'],
      name: data['name'],
      cpf: data['cpf'] ?? '',
      birthday: data['birthday'] ?? '',
      telephone: data['telephone'] ?? '',
      keyWords: keyWords,
      urlProfilePicture: data['urlProfilePicture'],
      email: data['email'] ?? "",
      rests: rents,
    );
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'uid': uid,
      'name': name,
      'cpf': cpf,
      'birthday': birthday,
      'telephone': telephone,
      'clepyTypeUser': clepyTypeUser.index,
      'keyWords': keyWords,
      'urlProfilePicture': urlProfilePicture,
    };
    return map;
  }
}
