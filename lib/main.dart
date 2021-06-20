import 'package:flutter/material.dart';
import 'package:iqf_app/screens/signUpPage.dart';
import './screens/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(),
      home: LoginPage(),
      routes: {
        '/signUp': (context) => SignUpPage()
      },
    );
  }
}
