class UserConfigs {
  bool showOnboarding;

  UserConfigs({
    required this.showOnboarding,
  });

  factory UserConfigs.fromMap(Map<String, dynamic> data) {
    return UserConfigs(
      showOnboarding: data['showOnboarding'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "showOnboarding": showOnboarding,
    };
  }
}
