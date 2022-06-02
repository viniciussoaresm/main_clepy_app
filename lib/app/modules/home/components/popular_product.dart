import 'package:clepy/app/components/product_card.dart';
import 'package:clepy/app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:clepy/app/utils/size_config.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(
              inputWidth: 20,
            ),
          ),
          child: SectionTitle(title: "Produtos Populares", press: () {}),
        ),
        SizedBox(
          height: getProportionateScreenWidth(
            inputWidth: 20,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if (demoProducts[index].isPopular) {
                    return ProductCard(product: demoProducts[index]);
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(
                width: getProportionateScreenWidth(
                  inputWidth: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
