enum Routes {
  home,
  onboarding,
  authentication,
}

extension RoutesExt on Routes {
  String get path {
    switch (this) {
      case Routes.onboarding:
        return '/onboarding';
      case Routes.home:
        return '/home';
      case Routes.authentication:
        return '/auth';
    }
  }
}
