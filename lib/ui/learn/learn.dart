//
// Work in progress
//


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soc/ui/widgets/drawer.dart';
import 'package:soc/ui/widgets/learning_content.dart';
import 'package:soc/utils/_index.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return LearnView();
  }
}

List<String> title = [
  'Tying in Knots',
  'The Point Flow and Rhythm',
  'The blade and brush stroke',
  'Knitting and sorting',
  'Tying in Knots',
];

class LearnView extends StatefulWidget {
  const LearnView({Key? key}) : super(key: key);

  @override
  _LearnViewState createState() => _LearnViewState();
}

class _LearnViewState extends State<LearnView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  _toggleAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  final segmentTitle = <int, Widget>{
    0: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        'Documents',
        style: TextStyles.tabStyle,
      ),
    ),
    1: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        'Videos',
        style: TextStyles.tabStyle,
      ),
    ),
  };

  final children = <int, Widget>{
    0: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(20.0),
            child: Wrap(
              children: <Widget>[
                FractionallySizedBox(
                    widthFactor: 0.4,
                    child: Padding(
                      padding: EdgeInsets.all(Adapt.px(20)),
                      child: Placeholder(
                        color: Colors.black,
                        fallbackHeight: Adapt.screenH() * 0.15,
                      ),
                    )),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Adapt.px(20),
                      bottom: Adapt.px(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title[index],
                          style: TextStyles.cardStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.appTheme(context).txt,
                          ),
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Brass bringing joy into surgical training. This concept is derived from',
                          style: TextStyles.cardStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.appTheme(context).midGrey,
                          ),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '19m 15s',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppTheme.appTheme(context).txt,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
    1: Center(
      child: Text(
        'Videos',
        style: TextStyles.tabStyle,
      ),
    )
  };
  int currentSegment = 0;
  void onValueChanged(int? value) {
    setState(() {
      currentSegment = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final leftSlide = MediaQuery.of(context).size.width * 0.6;
    final bottomSlide = MediaQuery.of(context).size.height * 0.15;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double rightSlide = leftSlide * _animationController.value;
        double topSlide = bottomSlide * _animationController.value;
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              body: const DrawerData(),
            ),
            Transform(
              transform: Matrix4.identity()..translate(rightSlide, topSlide),
              alignment: Alignment.center,
              child: Scaffold(
                backgroundColor: Color(0xFFEFEFEF),
                appBar: AppBar(
                  elevation: 0,
                  leadingWidth: Adapt.px(80),
                  backgroundColor: Color(0xFFEFEFEF),
                  title: Text(
                    'Learn Media',
                    style: TextStyles.appBarTextStyle,
                  ),
                  leading: IconButton(
                    splashRadius: Adapt.px(10),
                    onPressed: () {
                      SystemChrome.setSystemUIOverlayStyle(
                        SystemUiOverlayStyle(
                          statusBarColor: Colors.transparent,
                          statusBarIconBrightness:
                              _animationController.value == 0
                                  ? Brightness.light
                                  : Brightness.dark,
                        ),
                      );
                      _toggleAnimation();
                    },
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _animationController,
                      color: AppTheme.appTheme(context).txt,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(Adapt.screenH() * 0.15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: Adapt.px(10),
                            left: Adapt.px(20),
                            right: Adapt.px(20),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CupertinoSlidingSegmentedControl(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 6),
                                    children: segmentTitle,
                                    onValueChanged: onValueChanged,
                                    groupValue: currentSegment,
                                    backgroundColor:
                                        CupertinoDynamicColor.withBrightness(
                                      color: Color(0xFFFFFFFF),
                                      darkColor: Color(0xFF636366),
                                    ),
                                    thumbColor: Color(0xFFEFEFEF),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                        'All ${currentSegment == 0 ? 'Documents' : 'Videos'}',
                                        style: TextStyles.appBarTextStyle
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: Adapt.px(30))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: LearningContent(
                  children: children,
                  currentSegment: currentSegment,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
