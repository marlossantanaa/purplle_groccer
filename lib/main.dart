import 'package:flutter/material.dart';

import 'package:purplle_groccer/src/pages/auth/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign in',
      theme: ThemeData(
        primarySwatch: Colors.purple,
       scaffoldBackgroundColor: Colors.grey.shade100,
       // scaffoldBackgroundColor: Colors.white.withAlpha(1000),
        splashColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      debugShowCheckedModeBanner: false
      ,
      home: const SignInScreen(),
    );
  }
}
