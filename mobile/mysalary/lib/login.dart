import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import './Configuration.dart' show Configuration ;
import './home.dart';

Future<http.Response>  authCore (String username, String password) async {
  Map<String, String> data = {"username": username, "password": password};
  var url = Configuration.fullHost+"/api/test/";
  return await http.post(url, body:data);
}


class LoginScreen extends StatelessWidget {
  BuildContext context;  
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    final responseData = await authCore(data.name, data.password);
    print("RESPONSE CODE: " + responseData.statusCode.toString());

    return Future.delayed(loginTime).then((_) {
      if (responseData.statusCode==403){
          return 'Authentication Failed';
      }
      Configuration.username = data.name;
      Configuration.password = data.password;
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {

  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return FlutterLogin(
      title: 'My Salary',
      logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MyHomePage(title: 'Home'),
          
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
