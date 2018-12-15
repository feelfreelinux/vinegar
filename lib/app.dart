import 'package:flutter/material.dart';
import 'package:vinegar/screens/screens.dart';
import 'package:vinegar/keys.dart';

class VinegarApp extends StatelessWidget {
  VinegarApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vinegar',
      navigatorKey: VinegarKeys.navKey,
      routes: {
        '/': (context) => MainScreen(),
      },
    );
  }
}
