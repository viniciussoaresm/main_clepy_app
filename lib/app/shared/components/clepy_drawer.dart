import 'package:clepy/app/shared/blocs/user_config/user_configs_cubit.dart';
import 'package:clepy/app/shared/blocs/user_config/user_configs_state.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:clepy_ui/components/app-bar/navigator_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ClepyDrawer extends StatelessWidget {
  const ClepyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserConfigsCubit, UserConfigsState>(
      builder: (context, state) {
        return Drawer(
          // backgroundColor: ClepyColors.brandPrimary,
          backgroundColor: ClepyColors.ice,
          child: ListView(
            children: [
              state.isLoged
                  ? UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: ClepyColors.brandPrimary,
                      ),
                      accountName: Text(
                        state.userData?.name ?? '',
                        style: TextStyle(
                          color: ClepyColors.ice,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      accountEmail: Text(
                        state.userData?.email ?? '',
                        style: TextStyle(
                          color: ClepyColors.ice,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: ClepyColors.ice,
                        radius: 60.0,
                        child: Image.asset(
                          'assets/images/profile.png',
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              NavigatorTile(
                icon: Icons.person_outline,
                title: Text(
                  'Entrar',
                  style: TextStyle(
                    color: ClepyColors.brandPrimary,
                  ),
                ),
                onTap: () => Modular.to.pushReplacementNamed('/auth'),
                hide: state.isLoged,
              ),
              NavigatorTile(
                icon: Icons.person_outline,
                title: Text(
                  'Cadastrar Produto',
                  style: TextStyle(
                    color: ClepyColors.brandPrimary,
                  ),
                ),
                onTap: () => Modular.to.pushNamed('/product'),
                hide: !state.isLoged,
              ),
              NavigatorTile(
                icon: Icons.person_off_rounded,
                title: Text(
                  'Sair',
                  style: TextStyle(
                    color: ClepyColors.brandPrimary,
                  ),
                ),
                onTap: () => FirebaseAuth.instance.signOut().then(
                      (value) => Modular.to.pushReplacementNamed('/auth'),
                    ),
                hide: !state.isLoged,
              )
            ],
          ),
        );
      },
    );
  }
}
