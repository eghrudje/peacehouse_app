import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peacehouse_app/screens/dashboard.dart';

void main() {
  runApp(LoginScreen());
}


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Login',
      onLogin: _loginUser,
      onSignup: _registerUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>DashboardScreen()));
      },
      onRecoverPassword: _recoveryPassword,
    );
  }

  Future<String> _loginUser(LoginData loginData) async {
    await _auth.signInWithEmailAndPassword(email: loginData.name.trim(), password: loginData.password)
        .then((user) => Fluttertoast.showToast(
      msg: 'Welcome ${loginData.name}',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.teal,
      textColor: Colors.white,
      fontSize: 16
    ))
        .catchError((e) => Fluttertoast.showToast(
        msg: '${e}',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16
    ));

     return '';
  }

  Future<String> _registerUser(LoginData signUpData) async{
    await _auth.createUserWithEmailAndPassword(email: signUpData.name.trim(), password: signUpData.password)
        .then((user)=> Fluttertoast.showToast(
        msg: 'Welcome ${signUpData.name}',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        fontSize: 16
    ))
        .catchError((e) => Fluttertoast.showToast(
        msg: '${e}',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16
    ));
    return '';
  }
  

 // Future<User> _handleSignUp(String email, String password) async{
 //   final FirebaseAuth _auth = FirebaseAuth.instance;
 //   final User _user = (await _auth.createUserWithEmailAndPassword (email: email, password: password)).user;
 //   return _user;
 // }

  Future<String> _recoveryPassword(String email) async{
    await _auth.sendPasswordResetEmail(email: email).catchError((e) => Fluttertoast.showToast(
        msg: '${e}',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16
    ));
    return '';
  }
}
