import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/check_rent_card.dart';

class ConfirmScreen extends StatelessWidget {
  static String routeName = "/cart";

  const ConfirmScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckRentCard(),
    );
  }

  //TODO Remover comentarios
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "Seu aluguél",
            style: TextStyle(color: Colors.black),
          ),
          /*Text(
            "${demoCarts.length} Alugueis",
            style: Theme.of(context).textTheme.caption,
          ),*/
        ],
      ),
    );
  }
}
