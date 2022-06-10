import 'package:clepy/app/modules/home/widget/home_feed.dart';
import 'package:clepy/app/shared/components/clepy_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClepyScaffold(
      body: HomeFeedScreen(),
    );
  }
}
