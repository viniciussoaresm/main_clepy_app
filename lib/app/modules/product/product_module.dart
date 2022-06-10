import 'package:clepy/app/modules/product/pages/product_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/:uid',
      child: (context, args) => ProductPage(
        uid: args.params['uid'],
      ),
    ),
  ];
}
