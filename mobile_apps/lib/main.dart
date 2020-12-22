import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traveller_helper/routes.dart';
import 'package:traveller_helper/services/contract_manager.dart';
import 'package:traveller_helper/utilities/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: thThemeData,
      initialRoute: '/',
      routes: routes,
    );
  }
}
