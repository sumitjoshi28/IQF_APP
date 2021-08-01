import 'dart:convert';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:iqf_app/models/fbLoginModel.dart';

class FbAuth {
  AccessToken? accessToken;

  String prettyPrint(Map json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  // Check if user is logged in or not.
  Future<bool> checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken != null) {
      print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
      // now you can call to  FacebookAuth.instance.getUserData();
      final userData = await FacebookAuth.instance.getUserData();
      prettyPrint(userData);
      return true;
    } else {
      return false;
    }
  }

  // Facebook login
  Future<String> login() async {
    var fbLoginModel = "";
    final LoginResult result = await FacebookAuth.instance.login(permissions: [
      'email',
      'public_profile'
    ]); // by default we request the email and the public profile

    if (result.status == LoginStatus.success) {
      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      fbLoginModel = FbLoginModel.fromJson(userData).name;
      print('My name is $fbLoginModel');
    } else {
      print(result.status);
      print(result.message);
    }

    return fbLoginModel;
  }

  // Facebook logout
  Future<void> logOut() async {
    await FacebookAuth.instance.logOut();
  }
}
