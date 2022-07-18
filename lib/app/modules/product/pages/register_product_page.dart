import 'dart:core';

import 'package:clepy_ui/clepy_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart' show HexColor;

import '../bloc/new_product/new_product_cubit.dart';
import '../bloc/new_product/new_product_state.dart';

class RegisterProductPage extends StatelessWidget {
  RegisterProductPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  late List<ClepyCategory> categories = [];
  final NewProductCubit cubit = Modular.get<NewProductCubit>();

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);

  //     final storageRef = FirebaseStorage.instance.ref();

  //     final mountainImagesRef = storageRef.child("product/123123123123.jpg");

  //     final task = mountainImagesRef.putFile(imageTemporary);
  //     bool resumed = await task.resume();

  //     String url = await mountainImagesRef.getDownloadURL();

  //     setState(() => this.image = imageTemporary);
  //   } on PlatformException catch (e) {
  //     print('Não foi possivel recuparar imagem: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClepyColors.brandLight,
        elevation: 0,
        title: const Text(
          'Cadastro de produto',
        ),
      ),
      backgroundColor: Colors.white,
      body: BlocConsumer<NewProductCubit, NewProductState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Modular.to.pushReplacementNamed('/home');
          }
        },
        builder: (context, state) {
          if (state.categories.isEmpty || state.isLoad) {
            if (state.categories.isEmpty) {
              cubit.loadCategories();
            }
            return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: cubit.uploadImage,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    width: 5,
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: state.localImage != null
                                    ? Image.file(
                                        state.localImage!,
                                        width: 160,
                                        height: 160,
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(
                                        Icons.add_a_photo,
                                        color: Colors.grey.shade300,
                                        size: 80.0,
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextFormField(
                                controller: cubit.nameTextController,
                                decoration: ThemeHelper().textInputDecoration(
                                  'Nome do produto',
                                  'Insira o nome do produto',
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextFormField(
                                controller: cubit.modelTextController,
                                decoration: ThemeHelper().textInputDecoration(
                                    'Modelo do Produto',
                                    'Insira o modelo do seu produto'),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextFormField(
                                controller: cubit.priceTextController,
                                decoration: ThemeHelper().textInputDecoration(
                                    "Valor do aluguel",
                                    "Insira o valor do aluguel"),
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (!(val!.isEmpty) &&
                                      !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                    return "Insira um valor";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            state.categories.isNotEmpty
                                ? DropdownButtonFormField(
                                    decoration:
                                        ThemeHelper().textInputDecoration(
                                      "Categoria",
                                      "Insira a categoria",
                                    ),
                                    value: cubit.selectedCategoryUid,
                                    items: state.categories.map(
                                      (ClepyCategory category) {
                                        return DropdownMenuItem<String>(
                                          value: category.uid,
                                          child: Text(
                                            category.title,
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    onChanged: (value) {
                                      cubit.setSelectedCategory(
                                        value.toString(),
                                      );
                                    },
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(height: 20.0),
                            FormField<bool>(
                              builder: (state) {
                                return Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Checkbox(
                                          value: cubit.checkTerms,
                                          onChanged: (value) {
                                            cubit.setCheckTerms(
                                              value ?? false,
                                            );
                                          },
                                        ),
                                        const Text(
                                          "Eu aceito os termos e condições",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        state.errorText ?? '',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Theme.of(context).errorColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                              validator: (value) {
                                if (cubit.checkTerms ?? false) {
                                  return 'Você precisa aceitar os termos e condições';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 20.0),
                            Container(
                              decoration:
                                  ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(
                                    "Cadastrar".toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Modular.get<NewProductCubit>().save(
                                    ClepyProduct(
                                      name: cubit.nameTextController.text,
                                      price: double.parse(
                                        cubit.priceTextController.text,
                                      ),
                                      description:
                                          "Modelo: ${cubit.modelTextController.text}",
                                      // urlPicture: image.path,
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ThemeHelper {
  InputDecoration textInputDecoration(
      [String lableText = "", String hintText = ""]) {
    return InputDecoration(
      labelText: lableText,
      hintText: hintText,
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),
    );
  }

  BoxDecoration inputBoxDecorationShaddow() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]);
  }

  BoxDecoration buttonBoxDecoration(BuildContext context,
      [String color1 = "", String color2 = ""]) {
    Color c1 = Theme.of(context).primaryColor;
    Color c2 = Theme.of(context).colorScheme.secondary;
    if (color1.isEmpty == false) {
      c1 = HexColor(color1);
    }
    if (color2.isEmpty == false) {
      c2 = HexColor(color2);
    }

    return BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 4),
          blurRadius: 5.0,
        )
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 1.0],
        colors: [
          c1,
          c2,
        ],
      ),
      color: Colors.deepPurple.shade300,
      borderRadius: BorderRadius.circular(30),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(
        const Size(50, 50),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  AlertDialog alartDialog(String title, String content, BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black38)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
