import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends WidgetModule {
  HomeModule({Key? key}) : super(key: key);

  @override
  final List<Bind> binds = [];

  @override
  Widget get view => HomePage();
}
