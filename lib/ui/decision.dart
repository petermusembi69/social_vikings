import 'package:flutter/material.dart';
import 'package:soc/services/_index.dart';
import 'package:soc/ui/auth/sign_in/sign_in.dart';
import 'package:soc/ui/learn/learn.dart';
import 'package:soc/utils/_index.dart';


class DecisionPage extends StatefulWidget {
  const DecisionPage({Key? key}) : super(key: key);

  @override
  _DecisionPageState createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: locator<AuthService>().authenticatedUID,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final isLoggedIn = snapshot.hasData;
            return isLoggedIn ? const LearnPage() : const SignInPage();
          } else {
            return const SignInPage();
          }
        });
  }
}
