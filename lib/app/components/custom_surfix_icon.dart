import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clepy/app/utils/size_config.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(
          inputWidth: 20,
        ),
        getProportionateScreenWidth(
          inputWidth: 20,
        ),
        getProportionateScreenWidth(
          inputWidth: 20,
        ),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionateScreenWidth(
          inputWidth: 18,
        ),
      ),
    );
  }
}
