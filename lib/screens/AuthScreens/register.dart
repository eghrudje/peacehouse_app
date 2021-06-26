import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peacehouse_app/authprovider/auth_provider.dart';
import 'package:peacehouse_app/screens/AuthScreens/reset.dart';

import '../dashboard.dart';
import 'loginmain.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register')
      ),
      body: isLoading == false? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 30,),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            MaterialButton(
              color: Colors.red,
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  AuthClass().createAccount(email: _emailController.text.trim(), password: _passwordController.text.trim()).then((value) => {
                  if (value == 'Account Created') {
                      setState(() {
                    isLoading = false;
                  }),
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashboardScreen()) , (route) => false),
                  } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value))),
                  }
                });
                },
            child: Text('Create Account'),

            ),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
              },
              child: Text('Already have an account? Login!'),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ResetPage()), (route) => false);
              },
              child: Text('Forgot password? Reset!'),
            ),
          ],
        ),
      ) : Center(child: CircularProgressIndicator()),
    );
  }
}
