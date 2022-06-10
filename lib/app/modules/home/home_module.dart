import 'package:clepy/app/modules/home/bloc/feed_bloc.dart';
import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory(
      (i) => FeedBloc(
        productCubit: i(),
      ),
    )
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
        ),
      ];
}
