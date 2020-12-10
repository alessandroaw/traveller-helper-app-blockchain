import 'package:flutter/material.dart';
import 'package:traveller_helper/screens/traveller.dart';
import 'package:traveller_helper/screens/traveller_order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.teal.shade100,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.teal,
          selectedItemColor: Colors.white,
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Traveller(),
        '/traveller-order': (context) => TravellerOrder(),
      },
    );
  }
}
