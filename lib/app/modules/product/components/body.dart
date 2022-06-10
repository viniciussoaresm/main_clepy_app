import 'package:clepy/app/modules/product/components/default_button.dart';
import 'package:clepy/app/modules/product/components/product_description.dart';
import 'package:clepy/app/modules/product/components/product_images.dart';
import 'package:clepy/app/modules/product/components/size_config.dart';
import 'package:clepy/app/modules/product/components/top_rounded_container.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);

  final ClepyProduct product;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ProductImages(),
        Hero(
          tag: 'test',
          child: Image.network(
            product!.urlPicture,
          ),
        ),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductDescription(
                product: product!,
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Conferir disponibilidade",
                          press: () async {
                            await launch(
                              // 'https://api.whatsapp.com/send?phone=5519996056974&text=tenho%interesse%no%produto%${product.name}%-%${product.uid}'),
                              'https://api.whatsapp.com/send?phone=5541998987858&text=Tenho%20interesse%20na%20${product.name}-${product.uid}',
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
