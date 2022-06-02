import 'package:clepy/app/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(
                inputHeight: 20,
              ),
            ),
            const HomeHeader(),
            SizedBox(
              height: getProportionateScreenHeight(
                inputHeight: 10,
              ),
            ),
            DiscountBanner(),
            Categories(),
            const SpecialOffers(),
            SizedBox(
              height: getProportionateScreenHeight(
                inputHeight: 30,
              ),
            ),
            const PopularProducts(),
            SizedBox(
              height: getProportionateScreenHeight(
                inputHeight: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
