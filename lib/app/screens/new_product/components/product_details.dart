import 'package:flutter/material.dart';

import 'body.dart';

class ProductDetails extends StatelessWidget {
  static String routeName = "";

  const ProductDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}
