import 'package:flutter/material.dart';
import 'package:clepy/app/utils/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(
              inputWidth: 18,
            ),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: const Text(
            "Ver Mais",
            style: TextStyle(
              color: Color(0xFFBBBBBB),
            ),
          ),
        ),
      ],
    );
  }
}
