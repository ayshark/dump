import 'package:dump/screens/StartupView.dart';
import 'package:dump/services/navigationService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'router/route.dart' as routes;
import 'router/pathnames.dart' as routeName;
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //TODO: disable the landscape mode
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DUMP',
      theme: ThemeData(primaryColor: Color.fromRGBO(48, 72, 75, 1)),
      onGenerateRoute: routes.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: routeName.StartUpRoute,
    );
  }
}
