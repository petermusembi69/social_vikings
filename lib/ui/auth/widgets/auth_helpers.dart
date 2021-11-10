import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soc/utils/_index.dart';

Widget labelTxt(String title) {
  return Padding(
    padding: EdgeInsets.only(
      top: Adapt.px(30),
      left: Adapt.px(30),
      right: Adapt.px(30),
    ),
    child: Text(
      title,
      style: TextStyles.appBarTextStyle,
    ),
  );
}

Widget textField(
    {required String hintText,
    required TextEditingController controller,
    required IconData icon}) {
  return Builder(builder: (context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Adapt.px(30),
        right: Adapt.px(30),
        top: Adapt.px(10),
      ),
      child: Material(
        shadowColor: AppTheme.appTheme(context).grey,
        borderRadius: BorderRadius.circular(12),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: icon == Icons.mail
              ? TextInputType.emailAddress
              : TextInputType.visiblePassword,
          obscureText: icon == Icons.lock,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: AppTheme.appTheme(context).quickSilver,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyles.medium,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
        ),
      ),
    );
  });
}

Widget actionButton({
  required VoidCallback voidCallBack,
  required Widget child,
}) {
  return Padding(
    padding: EdgeInsets.only(
      top: Adapt.px(30),
      left: Adapt.px(30),
      right: Adapt.px(30),
    ),
    child: MaterialButton(
      onPressed: voidCallBack,
      color: Color(0xffFFB339),
      minWidth: double.infinity,
      height: Adapt.px(90),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      child: child,
    ),
  );
}

Widget switchBetweenSignInAndSignUp({
  required String title,
  required String subTitle,
}) {
  return Builder(builder: (context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Adapt.px(30),
        left: Adapt.px(30),
        right: Adapt.px(30),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            subTitle == 'Sign Up'
                ? AppRouter.signUpRoute
                : AppRouter.logInRoute,
          );
        },
        child: RichText(
          text: TextSpan(
            style: TextStyles.standard,
            children: [
              TextSpan(
                text: title,
              ),
              TextSpan(
                text: subTitle,
                style: TextStyles.standard.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFB339),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
}

Widget buttonTxt(String title) {
  return Text(
    title,
    style: TextStyles.shopBtnTextStyle,
  );
}

PreferredSizeWidget appBar(String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(
      Adapt.screenH() * 0.25,
    ),
    child: Builder(builder: (context) {
      return Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 12),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ),
          Image.asset(
            'images/brain.png',
            height: Adapt.screenH() * 0.1,
          ),
        ],
      );
    }),
  );
}

Widget socialAuthButton({
  required VoidCallback voidCallBack,
  required Widget child,
}) {
  return Builder(
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: Adapt.px(30),
          right: Adapt.px(30),
          bottom: Adapt.px(30),
        ),
        child: MaterialButton(
          onPressed: voidCallBack,
          color: AppTheme.appTheme(context).bg1,
          minWidth: double.infinity,
          height: Adapt.px(90),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          child: child,
        ),
      );
    },
  );
}

Widget socialAuthButtonChild({
  required String imageUrl,
  required String title,
}) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Image.asset(
      imageUrl,
      height: Adapt.px(32),
    ),
    SizedBox(
      width: Adapt.px(20),
    ),
    Text(
      title,
      style: TextStyles.subHeading,
    ),
  ]);
}

Widget progressIndicator() {
  return Builder(builder: (context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: AppTheme.appTheme(context).greyWeak,
      ),
    );
  });
}

void onError(String error, void func, BuildContext context) => (error) {
      final snackBar = SnackBar(content: Text(error));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      func as Function;
    };
