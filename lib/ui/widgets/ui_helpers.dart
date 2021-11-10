import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:soc/services/_index.dart';
import 'package:soc/utils/_index.dart';

toggleAnimation(AnimationController animationController) {
  animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
}

appBar(AnimationController animationController, String title) {
  return AppBar(
    elevation: 0,
    leadingWidth: Adapt.px(100),
    backgroundColor: Color(0xFFF3F3F5),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.appBarTextStyle,
    ),
    leading: IconButton(
      splashRadius: Adapt.px(10),
      onPressed: () {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: animationController.value == 0
                ? Brightness.light
                : Brightness.dark,
          ),
        );
        toggleAnimation(animationController);
      },
      icon: Builder(builder: (context) {
        return AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: animationController,
          color: AppTheme.appTheme(context).txt,
        );
      }),
    ),
    actions: title == 'Inbox'
        ? [
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
            )
          ]
        : null,
  );
}

Widget questionTextField({
  required FocusNode focusNode,
  required TextEditingController controller,
}) {
  return Builder(builder: (context) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: 'Write Question here',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: Adapt.px(10),
          ),
          child: Container(
            width: Adapt.px(100),
            child: MaterialButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      controller: controller,
    );
  });
}

Widget profileImage() {
  return OctoImage(
    width: double.infinity,
    height: double.infinity,
    fit: BoxFit.cover,
    image: NetworkImage(locator<HiveService>().retrieveMember()!.image!),
    progressIndicatorBuilder: (context, progress) {
      double? value;
      var expectedBytes = progress?.expectedTotalBytes;
      if (progress != null && expectedBytes != null) {
        value = progress.cumulativeBytesLoaded / expectedBytes;
      }
      return Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          value: value,
          strokeWidth: 2,
          backgroundColor: AppTheme.appTheme(context).greyWeak,
        ),
      );
    },
    errorBuilder: (context, error, stacktrace) => const Icon(Icons.error),
  );
}

Widget profileText(String title) {
  return Text(
    title,
    style: TextStyles.createShopPlaceHolderStyle.copyWith(
      color: Colors.white,
    ),
  );
}
