import 'package:clepy/app/modules/authentication/bloc/new_user/new_user_bloc.dart';
import 'package:clepy/app/modules/authentication/bloc/new_user/new_user_event.dart';
import 'package:clepy/app/modules/authentication/bloc/new_user/new_user_state.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/clepy_standart_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class NewUserScreen extends StatelessWidget {
  NewUserScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final cpf = TextEditingController();
  final birthday = TextEditingController();
  final telephone = TextEditingController();
  final senha = TextEditingController();
  final confirmarSenha = TextEditingController();
  final nome = TextEditingController();
  final codigo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClepyColors.brandLight.withOpacity(0.2),
        elevation: 0,
      ),
      body: BackGround(
        widget: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: BlocProvider(
                create: (_) => NewUserBloc(NewUserStateInitial()),
                child: BlocBuilder<NewUserBloc, NewUserState>(
                    builder: (context, state) {
                  if (state is NewUserStateLoading) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is NewUserStateError) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/logo-horizontal.png',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Ops tivemos um erro!',
                              style: TextStyle(
                                color: ClepyColors.brandPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.mesageError,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PrimaryButton(
                              onTap: () {
                                BlocProvider.of<NewUserBloc>(context).add(
                                  NewUserEventConfirmError(),
                                );
                              },
                              label: 'Confirmar',
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          height: 80,
                          child:
                              Image.asset('assets/images/logo-horizontal.png'),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 800,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white54,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: email,
                                    decoration: const InputDecoration(
                                      labelText: 'Seu E-mail',
                                      //isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          !value.contains('@') ||
                                          !value.contains('.')) {
                                        return 'Insira um email valido';
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: nome,
                                  decoration: const InputDecoration(
                                    labelText: 'Seu Nome',
                                    //isDense: true,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: cpf,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Seu CPF',
                                      //isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Insira um CPF válido';
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: birthday,
                                    keyboardType: TextInputType.datetime,
                                    decoration: const InputDecoration(
                                      labelText: 'Data de Nascimento',
                                      //isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Insira sua data de nascimento';
                                      }
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    controller: telephone,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: 'Telefone',
                                      //isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Insira seu telefone';
                                      }
                                    }),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: TextFormField(
                              //     controller: codigo,
                              //     decoration: const InputDecoration(
                              //       labelText: 'Seu Código de Convite',
                              //       //isDense: true,
                              //       contentPadding:
                              //           EdgeInsets.fromLTRB(10, 10, 10, 0),
                              //     ),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: senha,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Senha',
                                    //isDense: true,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  ),
                                  validator: (value) {
                                    if (value == "" || value!.length < 6) {
                                      return "Insira uma senha de ao menos 6 digitos";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: confirmarSenha,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Senha',
                                    //isDense: true,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  ),
                                  validator: (value) {
                                    if (value != senha.text) {
                                      return "Senhas não conferem!";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  'Selecione algumas catégorias do seu interesse:',
                                  style: TextStyle(
                                    color: ClepyColors.brandPrimary,
                                  ),
                                ),
                              ),
                              MultiSelectContainer(
                                itemsDecoration: MultiSelectDecorations(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        ClepyColors.brandLight.withOpacity(0.1),
                                        ClepyColors.brandLight.withOpacity(0.2),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  selectedDecoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        ClepyColors.brandPrimary,
                                        ClepyColors.brandPrimary
                                            .withOpacity(0.9)
                                      ],
                                    ),
                                    border: Border.all(
                                        color: ClepyColors.brandLight),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                items: [
                                  MultiSelectCard(
                                    value: 'oYBUt3gkCLMhJTLsiViw',
                                    label: 'Photo e vídeo',
                                  ),
                                  MultiSelectCard(
                                    value: '77HasYubpPCEFbIsKaoB',
                                    label: 'Fitness',
                                  ),
                                ],
                                onChange: (allSelectedItems, selectedItem) {},
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text.rich(
                                    TextSpan(
                                      text:
                                          'Ao clicar em "Continuar" você concorda com os nossos ',
                                      children: [
                                        TextSpan(
                                          text:
                                              'Termos de Uso e politica de privacidade.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: ClepyColors.brandPrimary,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              PrimaryButton(
                                onTap: () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  } else {
                                    ClepyUser user = ClepyStandartUser(
                                      uid: '',
                                      name: nome.text,
                                      email: email.text,
                                      cpf: cpf.text,
                                      birthday: birthday.text,
                                      telephone: birthday.text,
                                      keyWords: [],
                                      urlProfilePicture: '',
                                    );
                                    BlocProvider.of<NewUserBloc>(context).add(
                                      NewUserEventSubmitNewUser(
                                        context,
                                        user: user,
                                        invite: codigo.text,
                                        password: senha.text,
                                      ),
                                    );
                                  }
                                },
                                label: 'Cadastrar',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                }),
              )),
        ),
      ),
    );
  }
}
