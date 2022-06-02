import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:clepy/app/utils/size_config.dart';

class DiscountBanner extends StatelessWidget {
  DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(
        getProportionateScreenWidth(
          inputWidth: 20,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(
          inputWidth: 20,
        ),
        vertical: getProportionateScreenWidth(
          inputWidth: 15,
        ),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(
            color: Colors.white,
          ),
          children: [
            const TextSpan(text: "Promoção de inauguração\n"),
            TextSpan(
              text: "Cashback de até 20%",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(
                  inputWidth: 24,
                ),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
