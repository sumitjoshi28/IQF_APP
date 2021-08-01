import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iqf_app/helper/fbAuth.dart';
import 'package:iqf_app/screens/onBoardingPage.dart';
import 'package:iqf_app/screens/signUpPage.dart';
import './screens/loginPage.dart';

FbAuth fbAuth = new FbAuth();
// Set default home.
Widget defaultHome = new LoginPage();
Future<void> main() async {
  // set  home screen
  //setHomeScreen();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future<void> setHomeScreen() async {
  // Get result of the login function.
  String name = await fbAuth.login();
  if (name.isNotEmpty) {
    defaultHome = OnBoardingPage(name: name);
  } else {
    defaultHome = LoginPage();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(),
      home: LoginPage(),
      routes: {'/signUp': (context) => SignUpPage()},
    );
  }
}
