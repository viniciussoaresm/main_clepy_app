import 'package:clepy/app/modules/product/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../components/body.dart';
import '../components/size_config.dart';

class ProductPage extends StatelessWidget {
  static String routeName = "/details";

  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const CustomAppBar(),
      ),
      body: const Body(),
    );
  }
}
