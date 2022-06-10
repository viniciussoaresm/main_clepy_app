import 'package:clepy/app/shared/components/clepy_drawer.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';

class ClepyScaffold extends StatelessWidget {
  const ClepyScaffold({
    Key? key,
    required this.body,
    this.appBar,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  final Widget body;
  final PreferredSize? appBar;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(color: ClepyColors.brandPrimary),
            title: Image.asset(
              'assets/images/logo-horizontal.png',
              scale: 2.8,
            ),
            centerTitle: true,
          ),
      drawer: const ClepyDrawer(),
      body: body,
    );
  }
}
