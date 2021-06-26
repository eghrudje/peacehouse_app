import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peacehouse_app/authprovider/auth_provider.dart';
import 'package:peacehouse_app/login.dart';
import 'package:peacehouse_app/screens/AuthScreens/loginmain.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  //String email  = FirebaseAuth.instance.currentUser.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(onPressed: () {
            AuthClass().signOut();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()) , (route) => false);
          }, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
       child: Text('Email'),

      ),
    );
  }
}
