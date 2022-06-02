import 'package:flutter/material.dart';
import 'package:shared/utils/constants.dart';
import 'package:clepy/app/utils/size_config.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
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
                  "Complete seu dados",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                const CompleteProfileForm(),
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
