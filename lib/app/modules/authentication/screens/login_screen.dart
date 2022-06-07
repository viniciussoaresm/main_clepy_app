import 'package:clepy/app/modules/authentication/bloc/login/login_bloc.dart';
import 'package:clepy/app/modules/authentication/bloc/login/login_event.dart';
import 'package:clepy/app/modules/authentication/bloc/login/login_state.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

final email = TextEditingController();
final senha = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = Modular.get<LoginBloc>();
    email.text = 'viniciussoaresm17@gmail.com';
    senha.text = '102030';

    return BlocProvider(
      create: (context) => loginBloc,
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        if (state.isLoading) {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ClepyColors.brandLight.withOpacity(0.2),
          ),
          body: BackGround(
            widget: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    height: 80,
                    child: Image.asset('assets/images/logo-horizontal.png'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Olá, que bom ver você aqui! ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black26,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      errorText: state.mesageError,
                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: senha,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      //isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: PrimaryButton(
                    onTap: () {
                      loginBloc.add(
                        DoLogin(
                          email: email.text,
                          password: senha.text,
                        ),
                      );
                    },
                    label: 'Entrar',
                    height: 45,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                  ),
                  child: PrimaryButton(
                    labelColor: Colors.red,
                    onTap: () {
                      Modular.to.pushReplacementNamed('/home');
                    },
                    label: 'Continuar sem Login',
                    height: 45,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: PrimaryButton(
                    onTap: () {
                      Modular.to.pushNamed('/auth/signup');
                    },
                    label: 'Criar um nova conta',
                    backGroundColors: [
                      ClepyColors.brandLight.withOpacity(0.2),
                      ClepyColors.brandLight.withOpacity(0.4)
                    ],
                    labelColor: Colors.black54,
                    height: 45,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Esqueceu sua senha?',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
