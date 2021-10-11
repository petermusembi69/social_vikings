import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soc/ui/widgets/drawer_wrapper.dart';
import 'package:soc/utils/_index.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy>
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
            'Privacy Policy',
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
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < 5; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      top: Adapt.px(30),
                      bottom: Adapt.px(30),
                      left: Adapt.px(30),
                      right: Adapt.px(10),
                    ),
                    child: Text(
                      '''Veniam laboris est ad sunt dolore occaecat adipisicing excepteur sint voluptate magna id adipisicing. Dolore ea occaecat magna ullamco ullamco cillum culpa sit duis qui sunt sint aliqua proident. Consequat quis deserunt ex eiusmod ullamco ut aute consectetur eiusmod incididunt.
Culpa et incididunt reprehenderit proident consequat.''',
                      textAlign: TextAlign.justify,
                      style: TextStyles.subHeading.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
