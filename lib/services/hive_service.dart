part of social_services;

abstract class HiveService {
  Future initBoxes();
  void clearPrefs();

  void persistToken(String token);
  String? retrieveToken();
}

class HiveServiceImpl implements HiveService {
  @override
  Future<void> initBoxes() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(SocialAppConfig.instance!.values.authBox);
  }

  @override
  void clearPrefs() {
    Hive.box<dynamic>(SocialAppConfig.instance!.values.authBox)
        .deleteAll(<String>['accessToken']);
  }

  @override
  void persistToken(String token) {
    Hive.box<dynamic>(SocialAppConfig.instance!.values.authBox)
        .put('accessToken', token);
  }

  @override
  String? retrieveToken() {
    final _box = Hive.box<dynamic>(SocialAppConfig.instance!.values.authBox);
    return _box.get('accessToken') as String?;
  }
}
