import 'package:clepy/app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clepy/app/utils/size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(
              inputWidth: 20,
            ),
          ),
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(
              getProportionateScreenWidth(
                inputWidth: 15,
              ),
            ),
            width: getProportionateScreenWidth(
              inputWidth: 64,
            ),
            decoration: BoxDecoration(
              color: product.isFavourite
                  ? const Color(0xFFFFE6E6)
                  : const Color(0xFFF5F6F9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color: product.isFavourite
                  ? const Color(0xFFFF4848)
                  : const Color(0xFFDBDEE4),
              height: getProportionateScreenWidth(
                inputWidth: 16,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(
              inputWidth: 20,
            ),
            right: getProportionateScreenWidth(
              inputWidth: 64,
            ),
          ),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(
              inputWidth: 20,
            ),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
