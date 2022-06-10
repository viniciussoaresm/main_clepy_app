import 'package:clepy/app/shared/blocs/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/blocs/user_config/user_configs_cubit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Modular.get<UserConfigsCubit>(),
          ),
          BlocProvider(
            create: (context) => Modular.get<ProductCubit>(),
          ),
        ],
        child: MaterialApp.router(
          title: 'Clepy',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        ));
  }
}
