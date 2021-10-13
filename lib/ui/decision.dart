import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:soc/utils/_index.dart';

class DecisionPage extends StatefulWidget {
  const DecisionPage({Key? key}) : super(key: key);

  @override
  _DecisionPageState createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  void _redirectToPage(BuildContext context, {required String routeName}) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        Navigator.popAndPushNamed(
          context,
          routeName,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    Adapt.initContext(context);
    TextStyles.initContext(context);
    return ValueListenableBuilder(
      valueListenable:
          Hive.box(SocialAppConfig.instance!.values.authBox).listenable(),
      builder: (context, Box box, _) {
        final member = box.get('member');
        if (member == null) {
          _redirectToPage(
            context,
            routeName: AppRouter.logInRoute,
          );
        } else {
          _redirectToPage(
            context,
            routeName: AppRouter.learnRoute,
          );
        }
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Social App',
                  style: themeData.textTheme.headline6!.copyWith(
                    color: AppTheme.appTheme(context).accent1Dark,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
