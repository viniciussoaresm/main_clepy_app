import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';

class NavigatorTile extends StatelessWidget {
  const NavigatorTile({
    Key? key,
    this.hide = false,
    required this.onTap,
    required this.icon,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  final Function onTap;
  final IconData icon;
  final Widget title;
  final Widget? subtitle;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return !hide
        ? ListTile(
            leading: Icon(
              icon,
              color: ClepyColors.brandPrimary,
            ),
            title: title,
            subtitle: subtitle,
            trailing: Icon(
              Icons.arrow_forward,
              color: ClepyColors.brandPrimary,
            ),
            onTap: () {
              onTap();
            },
          )
        : const SizedBox.shrink();
  }
}
