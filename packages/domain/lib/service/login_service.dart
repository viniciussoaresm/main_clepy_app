import 'package:domain/domain.dart';
import 'package:domain/entities/clepy_standart_user.dart';
import 'package:domain/repository/schemas/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginService extends UserRepository {
  Future<ClepyUser?> retrieverUser() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return null;
    }
    late ClepyUser user;
    ClepyQuery query = ClepyQuery(
      'uid',
      isEqualTo: FirebaseAuth.instance.currentUser!.uid,
    );
    await get([query]).then((value) {
      value.docs.forEach((element) {
        var dados = element.data() as Map<String, dynamic>;
        // if (dados['clepyTypeUser'] == ClepyTypeUser.standart) {
        user = ClepyStandartUser.fromMap(dados);
        // }
      });
    });

    return user;
  }

  Future insertNewUser(ClepyStandartUser user) async {
    await create(user.toMap());
  }

  Future<String?> newUserWithEMailAndPassword(
      String email, String password) async {
    String? uid;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uid = value.user!.uid;
    }).catchError((error) {
      throw error;
    });

    return uid;
  }

  Future<ClepyUser?> login(
      {required String login, required String password}) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      await firebaseAuth.signInWithEmailAndPassword(
          email: login, password: password);
    } catch (error) {
      print(error);
    }

    return await retrieverUser();
  }
}
