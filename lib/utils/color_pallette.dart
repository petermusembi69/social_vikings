part of social_utils;

class AppTheme {
  Color? bg1; //
  Color? surface; //
  Color? bg2;
  Color? accent1;
  Color? accent1Dark;
  Color? accent1Darker;
  Color? accent1Darkest;
  Color? accent1Lighter;
  Color? accent2;
  Color? accent3;
  Color? gunMetal;
  Color? grey;
  Color? darkGrey;
  Color? bokaraGrey;
  Color? greyMedium;
  Color? greyStrong;
  Color? gullGrey;
  Color? midGrey;
  Color? quickSilver;
  Color? greyWeak;


  Color? txt;
  Color? accentTxt;
  Color? accent1Txt;
  Color? accent2Txt;

  static AppTheme appTheme(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? isDarkTheme()
          : isLightTheme();

  static AppTheme isLightTheme() {
    return AppTheme()
      ..bg1 = const Color(0xFFffffff)
      ..bg2 = const Color(0xfff1f7f0)
      ..surface = Colors.white
      ..accent1 = const Color(0xff509432)
      ..gunMetal = const Color(0xff2F2E41)
      ..greyWeak = const Color(0xffD8D8D8)
      ..grey = const Color(0xff515d5a)
      ..darkGrey = const Color(0xffADADAD)
      ..greyMedium = const Color(0xffF4F6FB)
      ..greyStrong = const Color(0xff151918)
      ..bokaraGrey = const Color(0xff272422)
      ..gullGrey = const Color(0xffAEB1B3)
      ..midGrey = const Color(0xff707273)
      ..quickSilver = const Color(0xffA3A3A3)
      ..txt = Colors.black
      ..accentTxt = Colors.black
      ..accent1Txt = const Color(0xFF7C7D7E)
      ..accent2Txt = const Color(0xFF234135);
  }

  static AppTheme isDarkTheme() {
    return AppTheme()
      ..bg1 = const Color(0xff00120f)
      ..bg2 = const Color(0xff2c2c2c)
      ..surface = const Color(0xff252525)
      ..accent1 = const Color(0xff55a632)
      ..accent1Dark = const Color(0xff185154)
      ..accent1Darker = const Color(0xff145162)
      ..accent1Darkest = const Color(0xff4A4B4D)
      ..accent1Lighter = const Color(0xff2d6472)
      ..accent2 = const Color(0xfff19e46)
      ..accent3 = const Color(0xff5BC91A)
      ..gunMetal = const Color(0xff2F2E41)
      ..greyWeak = const Color(0xffa8b3b0)
      ..grey = const Color(0xffced4d3)
      ..darkGrey = const Color(0xffADADAD)
      ..gullGrey = const Color(0xffAEB1B3)
      ..greyMedium = const Color(0xffF4F6FB)
      ..greyStrong = const Color(0xffffffff)
      ..bokaraGrey = const Color(0xff272422)
      ..midGrey = const Color(0xff707273)
      ..quickSilver = const Color(0xffA3A3A3)
      ..txt = Colors.white
      ..accentTxt = Colors.white
      ..accent1Txt = const Color(0xFF7C7D7E)
      ..accent2Txt = const Color(0xFF234135);
  }
}
