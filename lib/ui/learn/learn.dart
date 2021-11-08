import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soc/ui/learn/widget/learn_helpers.dart';
import 'package:soc/ui/widgets/drawer_wrapper.dart';
import 'package:soc/ui/widgets/learning_content.dart';
import 'package:soc/ui/widgets/ui_helpers.dart';
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

class LearnView extends StatefulWidget {
  const LearnView({Key? key}) : super(key: key);

  @override
  _LearnViewState createState() => _LearnViewState();
}

class _LearnViewState extends State<LearnView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int currentSegment = 1;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onValueChanged(int? value) {
    setState(
      () {
        currentSegment = value!;
      },
    );
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
              toggleAnimation(_animationController);
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
                          children: learnTabTitle,
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
          children: learnTabchildren,
          currentSegment: currentSegment,
        ),
      ),
    );
  }
}
