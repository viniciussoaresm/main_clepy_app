import 'dart:io';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/new_product/new_product_cubit.dart';

class RegisterProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterProductPageState();
  }
}

class _RegisterProductPageState extends State<RegisterProductPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  File? image;

  final nameTextController = TextEditingController();
  final valueTextController = TextEditingController();
  final modelTextController = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Não foi possivel recuparar imagem: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                            child: image != null
                                ? Image.file(
                                    image!,
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
                          onTap: () {
                            pickImage();
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: nameTextController,
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
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: modelTextController,
                            decoration: ThemeHelper().textInputDecoration(
                                'Modelo do Produto',
                                'Insira o modelo do seu produto'),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: TextFormField(
                            controller: valueTextController,
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
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    const Text(
                                      "Eu aceito os termos e condições",
                                      style: TextStyle(color: Colors.grey),
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
                            if (!checkboxValue) {
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
                                  name: nameTextController.text,
                                  price: double.parse(valueTextController.text),
                                  description:
                                      "Modelo: ${modelTextController.text}",
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
