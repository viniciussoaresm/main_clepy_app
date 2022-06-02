import 'package:clepy/app/screens/new_product/components/complete_product.dart';
import 'package:flutter/material.dart';
import 'package:clepy/app/utils/size_config.dart';
import 'package:shared/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(
              inputWidth: 20,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                  "Completar Cadastro",
                  style: headingStyle,
                ),
                const Text(
                  "Complete os dados do seu equipamento",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                const CompleteProductForm(),
                SizedBox(
                  height: getProportionateScreenHeight(
                    inputHeight: 30,
                  ),
                ),
                Text(
                  "Ao continuar você confirma que concorda \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
