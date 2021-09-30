part of social_utils;

class AppRouter {
  static const String intialRoute = '/';
  static const String logInRoute = '/log_in';
  static const String signUpRoute = '/sign_up';
  static const String learnRoute = '/learn';
  static const String inboxRoute = '/inbox';
  static const String askQuestionsRoute = '/ask_questions';
  static const String privacyPolicyRoute = '/privacy_policy';
  static const String profileRoute = '/profile';
  static const String errorPageRoute = '/404_error_page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final _args = settings.arguments;

    switch (settings.name) {
      case intialRoute:
        return _route(
          const DecisionPage(),
          intialRoute,
        ) as Route<dynamic>;
      case logInRoute:
        return _route(
          const SignInPage(),
          logInRoute,
        ) as Route<dynamic>;
      case signUpRoute:
        return _route(
          const SignUpPage(),
          signUpRoute,
        ) as Route<dynamic>;
      case inboxRoute:
        return _route(
          const InboxPage(),
          inboxRoute,
        ) as Route<dynamic>;
      case profileRoute:
        return _route(
          const ProfilePage(),
          profileRoute,
        ) as Route<dynamic>;
      case askQuestionsRoute:
        return _route(
          const AskQuestionsPage(),
          askQuestionsRoute,
        ) as Route<dynamic>;

      default:
        return _route(
          Scaffold(
            appBar: AppBar(
              title: const Text('Social App'),
            ),
            body: const Center(
              child: Text('Unknown page'),
            ),
          ),
          'unknown',
        ) as Route<dynamic>;
    }
  }

  static dynamic _route(Widget page, String route) {
    if (route == logInRoute || route == learnRoute || route == signUpRoute) {
      return PageRoutes.sharedAxis<dynamic>(
        () => page,
      );
    } else {
      return CupertinoPageRoute<dynamic>(
        builder: (context) {
          return page;
        },
      );
    }
  }
}
