import 'package:clepy/app/components/no_account_text.dart';
import 'package:clepy/app/components/socal_card.dart';
import 'package:flutter/material.dart';
import 'package:clepy/app/utils/size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(
              inputWidth: 20,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  "Bem Vindo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(
                      inputWidth: 28,
                    ),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Entre com seu email e senha \nou continue com uma rede social",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                const SignForm(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {},
                    ),
                    SocalCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(
                    inputHeight: 20,
                  ),
                ),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
