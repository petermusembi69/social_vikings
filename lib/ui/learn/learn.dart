import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soc/ui/widgets/drawer_wrapper.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
      child: Text(
        'Documents',
        style: TextStyles.subHeading,
      ),
    ),
    1: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
      child: Text(
        'Videos',
        style: TextStyles.subHeading,
      ),
    ),
  };

  final children = <int, Widget>{
    1: ListView.builder(
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
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.05),
                                spreadRadius: 0.5,
                                blurRadius: 6,
                                offset: Offset(2, 6),
                              ),
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          child: Image.asset(
                            'images/videoimage.png',
                          ),
                        ),
                      ),
                    )),
                FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Container(
                    height: kToolbarHeight * 1.8,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: Adapt.px(20),
                        bottom: Adapt.px(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title[index],
                            style: TextStyles.subHeading,
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Text(
                            'Brass bringing joy into surgical training. This concept is derived from',
                            style: TextStyles.medium,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: Colors.black,
                                size: Adapt.px(28),
                              ),
                              SizedBox(
                                width: Adapt.px(4),
                              ),
                              Text(
                                '19m 15s',
                                style: TextStyles.standard,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
    0: Center(
      child: Text(
        'Videos',
        style: TextStyles.tabStyle,
      ),
    )
  };
  int currentSegment = 1;
  void onValueChanged(int? value) {
    setState(() {
      currentSegment = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DrawerWraper(
      animationController: _animationController,
      page: Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        appBar: AppBar(
          elevation: 0,
          leadingWidth: Adapt.px(120),
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
                  statusBarIconBrightness: _animationController.value == 0
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
            preferredSize: Size.fromHeight(Adapt.screenH() * 0.12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: Adapt.px(10),
                    left: Adapt.px(40),
                    right: Adapt.px(40),
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CupertinoSlidingSegmentedControl(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                          children: segmentTitle,
                          onValueChanged: onValueChanged,
                          groupValue: currentSegment,
                          backgroundColor: CupertinoDynamicColor.withBrightness(
                            color: Color(0xFFFFFFFF),
                            darkColor: Color(0xFF636366),
                          ),
                          thumbColor: Color(0xFFEFEFEF),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                              'All ${currentSegment == 0 ? 'Documents' : 'Videos'}',
                              style: TextStyles.heading),
                        ),
                      ],
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
    );
  }
}
