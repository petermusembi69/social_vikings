part of social_utils;

class SocialAppValues {
  SocialAppValues({
    required this.baseDomain,
    required this.authBox,
    required this.googleApiKey,
  });

  final String baseDomain;
  final String authBox;
  final String googleApiKey;
}

class SocialAppConfig {
  factory SocialAppConfig({required SocialAppValues values}) {
    return _instance ??= SocialAppConfig._internal(values);
  }

  SocialAppConfig._internal(this.values);

  final SocialAppValues values;
  static SocialAppConfig? _instance;

  static SocialAppConfig? get instance => _instance;
}
