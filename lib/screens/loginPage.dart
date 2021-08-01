import 'package:flutter/material.dart';
import 'package:iqf_app/helper/fbAuth.dart';
import 'package:iqf_app/helper/palatte.dart';
import 'package:iqf_app/screens/onBoardingPage.dart';
import 'package:iqf_app/widgets/widgets.dart';

FbAuth fbAuth = new FbAuth();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    child: Image(
                        image: AssetImage('assets/images/mainlogo.png'),
                        height: 200,
                        width: 200),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'WELCOME BACK',
                        style: kHeading,
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Login to your account',
                        style: lHeading,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              icon: Icons.email,
                              hint: 'Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            PasswordInput(
                              icon: Icons.lock,
                              hint: 'Password',
                              inputAction: TextInputAction.done,
                            ),
                            SizedBox(height: 10),
                            Text('Forgot Password?', style: kBodyText),
                            Column(
                              children: [
                                SizedBox(height: 30),
                                RoundedButton(
                                  buttonText: 'Sign in',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          String name = await fbAuth.login();
                                          if (name != "") {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OnBoardingPage(
                                                            name: name)));
                                          }
                                        },
                                        child: Text("Login with Facebook"))),
                                SizedBox(
                                  height: 100,
                                ),
                                Container(
                                    child: GestureDetector(
                                  child: Text(
                                    'Don\'t have an account?',
                                    style: kBodyText,
                                  ),
                                  onTap: () {
                                    // Navigate to the sign up screen by using the named route.
                                    Navigator.pushNamed(context, '/signUp');
                                  },
                                )),
                                Container(
                                    child: GestureDetector(
                                  child: Text(
                                    'Sign up here',
                                    style: kBodyTextBlue,
                                  ),
                                  onTap: () {
                                    // Navigate to the sign up screen by using the named route.
                                    Navigator.pushNamed(context, '/signUp');
                                  },
                                )),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
