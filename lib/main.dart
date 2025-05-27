import 'package:cepidl_app/screens/details_screen.dart';
import 'package:cepidl_app/screens/login_screen.dart';
import 'package:cepidl_app/screens/splash_screen.dart';
import 'package:cepidl_app/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:cepidl_app/constants.dart';
import 'package:cepidl_app/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CEPIDL APP',
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(color: kTextColor),
              bodyMedium: TextStyle(color: kTextColor),
              titleLarge: TextStyle(color: kTextColor),
            ),
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => const LoginScreen(),
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/details': (context) => const DetailScreen(),
        '/start': (context) => const StartScreen(),
      },
    );
  }
}
