import 'package:clepy/app/modules/product/bloc/new_product/new_product_cubit.dart';
import 'package:clepy/app/modules/product/pages/register_product_page.dart';
import 'package:clepy/app/modules/product/pages/product_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => NewProductCubit(
        productsService: i(),
        categoryService: i(),
      ),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/:uid',
      child: (context, args) => ProductPage(
        uid: args.params['uid'],
      ),
    ),
    ChildRoute(
      '/',
      child: (context, args) => BlocProvider(
        create: (context) => Modular.get<NewProductCubit>(),
        child: RegisterProductPage(),
      ),
    ),
  ];
}
