import 'package:domain/enums/clepy_type_user.dart';

import 'clepy_product.dart';
import 'clepy_user.dart';

class ClepyStoreUser extends ClepyUser {
  ClepyStoreUser({
    required String uid,
    required String name,
    required String email,
    required String cpf,
    required String birthday,
    required String telephone,
    required this.urlProfilePicture,
    this.myProducts,
  }) : super(
          uid: uid,
          name: name,
          cpf: cpf,
          birthday: birthday,
          telephone: telephone,
          clepyTypeUser: ClepyTypeUser.store,
          email: email,
        );

  final String urlProfilePicture;
  List<ClepyProduct>? myProducts = [];

  factory ClepyStoreUser.fromMap(Map<String, dynamic> data) {
    List<ClepyProduct> myProducts = [];

    if (data['myProducts'] != null) {
      data['myProducts'].forEach((product) {
        myProducts.add(ClepyProduct.fromMap(product));
      });
    }

    return ClepyStoreUser(
      uid: data['uid'],
      name: data['name'],
      cpf: data['cpf'],
      birthday: data['birthday'],
      telephone: data['telephone'],
      urlProfilePicture: data['urlProfilePicture'],
      email: data['email'],
      myProducts: myProducts,
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
      'urlProfilePicture': urlProfilePicture,
    };
    return map;
  }
}
