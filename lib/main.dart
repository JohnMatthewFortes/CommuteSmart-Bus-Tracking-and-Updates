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
          bodySmall: TextStyle(fontSize: 14, color: Colors.black54),
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
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/welcome':
            return _buildRoute(settings, WelcomePage());
          case '/signup':
            return _buildRoute(settings, SignupPage());
          case '/login':
            return _buildRoute(settings, LoginPage());
          case '/home':
            return _buildRoute(settings, HomePage());
          case '/bus_location':
            return _buildRoute(settings, BusLocation());
          case '/terminal':
            return _buildRoute(settings, BusTerminal());
          case '/notifications':
            return _buildRoute(settings, NotificationsPage());
          default:
            return null;
        }
      },
    );
  }
  PageRouteBuilder _buildRoute(RouteSettings settings, Widget page) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
