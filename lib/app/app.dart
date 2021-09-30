// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soc/utils/_index.dart';
// import 'package:soc/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppTheme.appTheme(context).accent1,
      theme: ThemeData(
        accentColor: AppTheme.appTheme(context).accent1,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      // supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: AppRouter.intialRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
