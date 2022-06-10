import 'package:clepy/app/guards/auth_guard.dart';
import 'package:clepy/app/modules/authentication/authentication_module.dart';
import 'package:clepy/app/modules/home/home_module.dart';
import 'package:clepy/app/modules/onboarding/onboarding_page.dart';
import 'package:clepy/app/modules/product/product_module.dart';
import 'package:clepy/app/modules/splash/splash_page.dart';
import 'package:clepy/app/shared/blocs/product/product_cubit.dart';
import 'package:clepy/app/shared/blocs/user_config/user_configs_cubit.dart';
import 'package:clepy_caches/clepy_caches.dart';
import 'package:domain/service/products_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'shared/enums/route_names.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => UserConfigRepository(),
    ),
    Bind.lazySingleton(
      (i) => GetUserConfigs(
        userConfigRepository: i(),
      ),
    ),
    Bind.lazySingleton(
      (i) => SetUserConfigs(
        userConfigRepository: i(),
      ),
    ),
    Bind.lazySingleton(
      (i) => UserConfigsCubit(
        getUserConfigs: i(),
        setUserConfigs: i(),
      ),
    ),
    Bind.lazySingleton(
      (i) => ProductsService(),
    ),
    Bind.lazySingleton(
      (i) => ProductCubit(
        productsService: i(),
      ),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const SplashPage(),
    ),
    ModuleRoute(
      Routes.home.path,
      module: HomeModule(),
    ),
    ChildRoute(
      Routes.onboarding.path,
      child: (context, args) => OnboardingPage(),
    ),
    ModuleRoute(
      Routes.authentication.path,
      module: AuthenticationModule(),
    ),
    ModuleRoute(Routes.product.path, module: ProductModule(), guards: [
      AuthGuard(),
    ]),
  ];
}
