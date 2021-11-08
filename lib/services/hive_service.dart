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
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(MemberAuthAdapter());
      await Hive.openBox<dynamic>(SocialAppConfig.instance!.values.authBox);
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  @override
  void clearPrefs() {
    try {
      Hive.box<dynamic>(SocialAppConfig.instance!.values.authBox)
          .deleteAll(<String>['accessToken', 'member']);
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  @override
  void persistMemeber(MemberAuthDTO member) {
    try {
      Hive.box(SocialAppConfig.instance!.values.authBox).put('member', member);
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  @override
  MemberAuthDTO? retrieveMember() {
    try {
      final _box = Hive.box(SocialAppConfig.instance!.values.authBox);
      return _box.get('member') as MemberAuthDTO?;
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  @override
  void persistToken(String token) {
    try {
      Hive.box<dynamic>(SocialAppConfig.instance!.values.authBox)
          .put('accessToken', token);
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  @override
  String? retrieveToken() {
    try {
      final _box = Hive.box<dynamic>(SocialAppConfig.instance!.values.authBox);
      return _box.get('accessToken') as String?;
    } catch (e) {
      Logger().e(e.toString());
    }
  }
}
