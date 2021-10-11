import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soc/ui/widgets/drawer_wrapper.dart';
import 'package:soc/ui/widgets/inbox_card.dart';
import 'package:soc/utils/_index.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage>
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

  @override
  Widget build(BuildContext context) {
    return DrawerWraper(
      animationController: _animationController,
      page: Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        appBar: AppBar(
          elevation: 0,
          leadingWidth: Adapt.px(100),
          backgroundColor: Color(0xFFEFEFEF),
          centerTitle: true,
          title: Text(
            'Inbox',
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
          actions: [
            Padding(
              padding: EdgeInsets.only(right: Adapt.px(20)),
              child: IconButton(
                icon: Icon(
                  Icons.star_rate_rounded,
                  size: Adapt.px(50),
                  color: Colors.black,
                ),
                splashRadius: Adapt.px(20),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return InboxCard(
                index: index,
              );
            }),
      ),
    );
  }
}
