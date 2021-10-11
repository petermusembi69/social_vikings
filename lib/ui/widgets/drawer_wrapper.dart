import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soc/ui/widgets/drawer.dart';

class DrawerWraper extends StatefulWidget {
  DrawerWraper({
    Key? key,
    required this.animationController,
    required this.page,
  }) : super(key: key);

  final AnimationController animationController;
  final Widget page;
  @override
  _DrawerScreenWrapper createState() => _DrawerScreenWrapper();
}

class _DrawerScreenWrapper extends State<DrawerWraper>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final leftSlide = MediaQuery.of(context).size.width * 0.6;
    final scaleValue = 0.2;

    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        double rightSlide = leftSlide * widget.animationController.value;
        double scale = 1 - (scaleValue * widget.animationController.value);
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              body: const DrawerData(),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(
                  rightSlide,
                )
                ..scale(scale),
              alignment: Alignment.center,
              child: widget.page,
            ),
          ],
        );
      },
    );
  }
}
