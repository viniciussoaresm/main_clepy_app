import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clepy/app/utils/size_config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.rating}) : super(key: key);

  final double rating;

  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(
            inputWidth: 20,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(
                inputWidth: 20,
              ),
              width: getProportionateScreenWidth(
                inputWidth: 20,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  primary: kPrimaryColor,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/icons/Back ICon.svg",
                  height: 15,
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    "$rating",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    "assets/icons/Star Icon.svg",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
