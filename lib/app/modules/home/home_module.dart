import 'package:clepy_ui/clepy_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home_page.dart';

class HomeModule extends WidgetModule {
  HomeModule({Key? key}) : super(key: key);

  @override
  final List<Bind> binds = [];

  @override
  Widget get view => const HomePage();
}
