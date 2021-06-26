import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peacehouse_app/login.dart';
import 'package:peacehouse_app/screens/AuthScreens/loginmain.dart';
import 'package:peacehouse_app/screens/AuthScreens/register.dart';
import 'package:peacehouse_app/screens/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if(auth.currentUser == null) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()) , (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashboardScreen()) , (route) => false);
      }
    });
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 80,),
      ),
    );
  }
}
