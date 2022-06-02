import 'package:clepy/app/enums/route_names.dart';
import 'package:clepy/app/guards/auth_guard.dart';
import 'package:clepy/app/modules/authentication/authentication_module.dart';
import 'package:clepy/app/modules/home/home_module.dart';
import 'package:clepy/app/modules/onboarding/onboarding_page.dart';
import 'package:clepy/app/modules/splash/splash_page.dart';
import 'package:clepy_caches/clepy_caches.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/blocs/user_configs_cubit.dart';

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
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const SplashPage(),
    ),
    ChildRoute(
      Routes.home.path,
      child: (context, args) => HomeModule(),
      guards: [
        AuthGuard(),
      ],
    ),
    ChildRoute(
      Routes.onboarding.path,
      child: (context, args) => OnboardingPage(),
    ),
    ModuleRoute(
      Routes.authentication.path,
      module: AuthenticationModule(),
    )
  ];
}
