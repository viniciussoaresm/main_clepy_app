import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavigatorTile extends StatelessWidget {
  const NavigatorTile({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final Function onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: ClepyColors.ice,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: ClepyColors.ice,
              ),
            )
          ],
        ),
      ),
    );
  }
}
