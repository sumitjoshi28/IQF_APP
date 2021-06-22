import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:iqf_app/palatte.dart';
import 'package:iqf_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
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
                                          final FacebookLoginResult result =
                                              await facebookSignIn
                                                  .logIn(['email']);

                                          switch (result.status) {
                                            case FacebookLoginStatus.loggedIn:
                                              final FacebookAccessToken
                                                  accessToken =
                                                  result.accessToken;
                                              final graphResponse =
                                                  await http.get(Uri.parse(
                                                      'https://graph.facebook.com/v2.12/me?fields=first_name,last_name,picture,email&access_token=${accessToken.token}'));
                                              final profile = jsonDecode(
                                                  graphResponse.body);
                                              print(profile);
                                              setState(() {
                                                String name =
                                                    profile["first_name"];
                                              });
                                              print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
                                              break;
                                            case FacebookLoginStatus
                                                .cancelledByUser:
                                              print(
                                                  'Login cancelled by the user.');
                                              break;
                                            case FacebookLoginStatus.error:
                                              print(
                                                  'Something went wrong with the login process.\n'
                                                  'Here\'s the error Facebook gave us: ${result.errorMessage}');
                                              break;
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
