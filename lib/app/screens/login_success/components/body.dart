import 'package:clepy/app/components/default_button.dart';
import 'package:clepy/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: MediaQuery.of(context).size.height * 0.4, //40%
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
        Text(
          "Produto cadastrado \ncom sucesso",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(
              inputWidth: 30,
            ),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: DefaultButton(
            text: "Voltar para a tela inicial",
            press: () {
              Modular.to.pushReplacementNamed('/home');
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
