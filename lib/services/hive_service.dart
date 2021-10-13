part of social_services;

abstract class HiveService {
  Future initBoxes();
  void clearPrefs();

  void persistToken(String token);
  String? retrieveToken();

  void persistMemeber(MemberAuthDTO member);
  MemberAuthDTO? retrieveMember();
}

class HiveServiceImpl implements HiveService {
  @override
  Future<void> initBoxes() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MemberAuthAdapter());
    await Hive.openBox<dynamic>(SocialAppConfig.instance!.values.authBox);
  }

  @override
  void clearPrefs() {
    Hive.box<dynamic>(SocialAppConfig.instance!.values.authBox)
        .deleteAll(<String>['accessToken', 'member']);
  }

  @override
  void persistMemeber(MemberAuthDTO member) {
    Hive.box(SocialAppConfig.instance!.values.authBox).put('member', member);
  }

  @override
  MemberAuthDTO? retrieveMember() {
    final _box = Hive.box(SocialAppConfig.instance!.values.authBox);
    return _box.get('member') as MemberAuthDTO?;
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
