import 'package:clepy/app/models/rent.dart';
import 'package:flutter/material.dart';
import 'package:clepy/app/utils/size_config.dart';
import 'package:shared/utils/constants.dart';

class RentCard extends StatelessWidget {
  const RentCard({
    Key? key,
    required this.rent,
  }) : super(key: key);

  final Rent rent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(
                  inputWidth: 10,
                ),
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(rent.product.images[0]),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rent.product.title,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${rent.product.price}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
                children: [
                  TextSpan(
                    text: " x${rent.numOfItem}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
