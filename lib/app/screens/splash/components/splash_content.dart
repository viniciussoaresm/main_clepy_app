import 'package:flutter/material.dart';
import 'package:clepy/app/utils/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Image.asset(
          "assets/images/logoclepy.png",
          height: getProportionateScreenHeight(
            inputHeight: 90,
          ),
          width: getProportionateScreenWidth(
            inputWidth: 135,
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(
            inputHeight: 265,
          ),
          width: getProportionateScreenWidth(
            inputWidth: 235,
          ),
        ),
      ],
    );
  }
}
