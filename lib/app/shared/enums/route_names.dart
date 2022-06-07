enum Routes {
  home,
  onboarding,
  authentication,
  product,
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
      case Routes.product:
        return '/product';
    }
  }
}
