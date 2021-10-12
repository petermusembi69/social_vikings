part of social_utils;

class TextStyles {
  static late AppTheme _appTheme;

  static void initContext(BuildContext context) {
    _appTheme = AppTheme.appTheme(context);
  }

  static final createShopPlaceHolderStyle = TextStyle(
    color: _appTheme.txt,
    fontSize: Adapt.px(28),
    fontWeight: FontWeight.w500,
  );

  static final appBarTextStyle = TextStyle(
    color: _appTheme.gunMetal,
    fontSize: Adapt.px(40),
    fontWeight: FontWeight.w500,
  );

  static final tabStyle = TextStyle(
    color: _appTheme.accent2Txt,
    fontSize: Adapt.px(32),
    fontWeight: FontWeight.bold,
  );

  static final heading = TextStyle(
    color: _appTheme.accent2Txt,
    fontSize: Adapt.px(32),
    fontWeight: FontWeight.bold,
  );

  static final subHeading = TextStyle(
    color: _appTheme.accent2Txt,
    fontSize: Adapt.px(28),
    fontWeight: FontWeight.bold,
  );

  static final medium = TextStyle(
      color: _appTheme.quickSilver,
      fontSize: Adapt.px(24),
      fontWeight: FontWeight.w500);

  static final standard = TextStyle(
      color: _appTheme.accent2Txt,
      fontSize: Adapt.px(24),
      fontWeight: FontWeight.bold);

  static final cardStyle = TextStyle(
    color: _appTheme.accent1,
    fontSize: Adapt.px(32),
    fontWeight: FontWeight.w500,
  );

  static final shopBtnTextStyle = TextStyle(
    color: _appTheme.bg1,
    fontSize: Adapt.px(32),
    fontWeight: FontWeight.w500,
  );
}
