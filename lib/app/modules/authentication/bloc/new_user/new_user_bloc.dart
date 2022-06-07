import 'package:domain/domain.dart';
import 'package:domain/entities/clepy_standart_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'new_user_event.dart';
import 'new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  NewUserBloc(NewUserState initialState) : super(initialState) {
    on<NewUserEvent>((event, emit) async {
      // verificando o evento
      if (event is NewUserEventSubmitNewUser) {
        emit(NewUserStateLoading());
        // verificando o convite
        // if (await InvitesServie().ValidInvite(event.invite) == false) {
        //   emit(NewUserStateError(user: event.user, typeError: 1));
        //   return;
        // }
        String? uid;

        try {
          uid = await LoginService()
              .newUserWithEMailAndPassword(event.user.email, event.password);

          ClepyStandartUser user = ClepyStandartUser(
            uid: uid!,
            name: event.user.name,
            email: event.user.email,
            keyWords: [],
            urlProfilePicture: 'urlProfilePicture',
          );

          await LoginService().insertNewUser(user);
        } catch (exception) {
          String messageError = 'Ops! Falha ao efeturar cadastro.';
          if (exception is FirebaseException &&
              exception.code == 'email-already-in-use') {
            messageError = 'Email já cadastrado!';
          }

          emit(
            NewUserStateError(
              user: event.user,
              mesageError: messageError,
            ),
          );
          return;
        }
        Modular.to.pushReplacementNamed('/home');
      } else if (event is NewUserEventConfirmError) {
        emit(NewUserStateErrorConfirm());
      }
    });
  }
}
