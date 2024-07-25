import 'package:flutter/material.dart';
import 'pages/login_signup/login_page.dart';
import 'pages/login_signup/signup_page.dart';
import 'pages/login_signup/welcome_page.dart';
import 'pages/homepage/home.dart';
import 'pages/homepage/bus.dart';
import 'pages/homepage/bus_terminal.dart';
import 'pages/homepage/notifications.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 26, color: Colors.black54),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black54),
          bodySmall: TextStyle(fontSize: 14, color:Colors.black54),
          headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
          headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
          labelLarge: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            elevation: 30,
            // shadowColor: Color.fromARGB(255, 199, 62, 62),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.green),
          ),
        ),
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/signup': (context) => SignupPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/bus_location': (context) => BusLocation(),
        '/terminal': (context) => BusTerminal(),
        '/notifications': (context) => NotificationsPage(),
      },
    );
  }
}
