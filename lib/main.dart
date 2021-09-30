import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soc/app/app.dart';
import 'package:soc/app/app_bloc_observer.dart';
import 'package:soc/services/_index.dart';
import 'package:soc/utils/_index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  SocialAppConfig(
    values: SocialAppValues(
        baseDomain: 'url', authBox: 'socialApp', googleApiKey: ''),
  );

  setUpServiceLocator();
  await locator<HiveService>().initBoxes();
  
  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
