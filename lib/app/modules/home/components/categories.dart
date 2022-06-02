import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clepy/app/utils/size_config.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {'icon': 'assets/icons/Camera Icon.svg', 'text': 'Fotografia'},
      {'icon': 'assets/icons/gymicon.svg', 'text': 'Academia'},
      {'icon': 'assets/icons/Game Icon.svg', 'text': 'Jogos'},
      {'icon': 'assets/icons/screwdrivericon.svg', 'text': 'Ferramentas'},
      {'icon': 'assets/icons/Discover.svg', 'text': 'Mais'},
    ];
    return Padding(
      padding: EdgeInsets.all(
        getProportionateScreenWidth(
          inputWidth: 20,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(
          inputWidth: 55,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(
                  inputWidth: 15,
                ),
              ),
              height: getProportionateScreenHeight(
                inputHeight: 55,
              ),
              width: getProportionateScreenWidth(
                inputWidth: 55,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            const SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
