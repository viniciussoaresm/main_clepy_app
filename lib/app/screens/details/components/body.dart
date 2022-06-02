import 'package:clepy/app/components/default_button.dart';
import 'package:clepy/app/models/product.dart';
import 'package:clepy/app/screens/verify_dispo/verify_disponibility.dart';
import 'package:flutter/material.dart';
import 'package:clepy/app/utils/size_config.dart';

import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    /*ColorDots(product: product),*/
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.15,
                          right: MediaQuery.of(context).size.width * 0.15,
                          bottom: getProportionateScreenWidth(
                            inputWidth: 40,
                          ),
                          top: getProportionateScreenWidth(
                            inputWidth: 15,
                          ),
                        ),
                        child: DefaultButton(
                          text: "Conferir disponibilidade",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DateAndTime(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
