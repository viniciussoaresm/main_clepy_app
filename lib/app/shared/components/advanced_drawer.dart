import 'package:clepy_ui/clepy_ui.dart';
import 'package:clepy_ui/components/app-bar/clepy_appBar.dart';
import 'package:clepy_ui/components/app-bar/navigator_tile.dart';
import 'package:domain/domain.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClepyDrawer extends StatefulWidget {
  final bool logoAppBar;
  final Widget body;
  final bool isLoged;
  final String name;

  const ClepyDrawer({
    Key? key,
    required this.body,
    this.logoAppBar = false,
    required this.isLoged,
    required this.name,
  }) : super(key: key);

  @override
  _ClepyDrawerState createState() => _ClepyDrawerState(
        logoAppBar: logoAppBar,
        body: body,
        isLoged: isLoged,
        name: name,
      );
}

class _ClepyDrawerState extends State<ClepyDrawer>
    with SingleTickerProviderStateMixin {
  final bool logoAppBar;
  final Widget body;
  final bool isLoged;
  final String name;

  _ClepyDrawerState({
    Key? key,
    required this.body,
    this.logoAppBar = false,
    required this.isLoged,
    required this.name,
  });

  late FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    // _retrieverData();
    _controller = FancyDrawerController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    )..addListener(
        () {
          setState(
            () {},
          ); // Must call setState
        },
      ); // This chunk of code is important
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyDrawerWrapper(
        backgroundColor: ClepyColors.brandPrimary, // Drawer background
        controller: _controller, // Drawer controller
        drawerItems: [
          CircleAvatar(
            child: Container(
              color: Colors.black26,
            ),
          ),
          isLoged
              ? Container()
              : Text(
                  name,
                  style: TextStyle(
                    color: ClepyColors.ice,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          NavigatorTile(
            icon: Icons.person_outline,
            text: isLoged ? 'Entrar' : 'Seu Perfil ',
            onTap: () => Modular.to.pushReplacementNamed('/auth'),
          ),
          isLoged
              ? Container()
              : NavigatorTile(
                  icon: Icons.close,
                  text: 'sair',
                  onTap: () => Modular.to.pushReplacementNamed('/auth'),
                ),
          const Text(
            "1.0.0",
            style: TextStyle(
              color: Colors.black26,
            ),
          )
        ], // Drawer items
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: logoAppBar ? ClepyAppBarLogo : ClepyAppBar,
            backgroundColor: ClepyColors.brandLight.withOpacity(0.2),
            leading: IconButton(
              icon: Icon(
                CupertinoIcons.list_bullet_indent,
                color: ClepyColors.brandPrimary,
              ),
              onPressed: () {
                if (_controller.state == DrawerState.closed) {
                  _controller.toggle();
                } else {
                  _controller.toggle();
                }
              },
            ),
          ),
          body: body,
        ),
      ),
    );
  }
}
