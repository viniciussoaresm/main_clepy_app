import 'package:clepy/app/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../enums/enums.dart';
import 'components/body.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
