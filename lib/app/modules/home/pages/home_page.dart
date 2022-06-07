import 'package:clepy/app/modules/authentication/bloc/login/login_bloc.dart';
import 'package:clepy/app/modules/authentication/bloc/login/login_state.dart';
import 'package:clepy/app/modules/home/widget/home_feed.dart';
import 'package:clepy/app/shared/blocs/user_configs_cubit.dart';
import 'package:clepy/app/shared/blocs/user_configs_state.dart';
import 'package:clepy/app/shared/components/advanced_drawer.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: HomeFeedScreen(),
      drawer: Drawer(backgroundColor: Colors.red),
    );

    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => Modular.get<UserConfigsCubit>(),
        child: BlocBuilder<UserConfigsCubit, UserConfigsState>(
            builder: (context, state) {
          return ClepyDrawer(
            isLoged: state.user != null,
            name: 'Vinicius',
            body: BackGround(
              widget: const HomeFeedScreen(),
            ),
          );
        }),
      ),
    );
  }
}
