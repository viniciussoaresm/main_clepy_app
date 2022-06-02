import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:clepy/app/utils/size_config.dart';
import 'package:shared/utils/constants.dart';

class NoAccountText extends StatelessWidget {
  NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Não possui uma conta? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(
              inputWidth: 16,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Modular.to.pushNamed('/auth/singup'),
          child: Text(
            "Inscreva-se",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(
                inputWidth: 16,
              ),
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
