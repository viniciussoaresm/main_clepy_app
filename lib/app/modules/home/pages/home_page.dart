import 'package:clepy/app/modules/home/widget/home_feed.dart';
import 'package:clepy/app/shared/components/advanced_drawer.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClepyDrawer(
        body: BackGround(
          widget: const HomeFeedScreen(),
        ),
      ),
    );
  }
}
