import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peacehouse_app/authprovider/auth_provider.dart';
import 'package:peacehouse_app/screens/AuthScreens/register.dart';

import '../dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Login Page')
      ),
      body: isLoading == false?  Padding(
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
                AuthClass().signInAccount(email: _emailController.text.trim(), password: _passwordController.text.trim()).then((value) => {
                  if (value == 'Welcome') {
                    setState(() {
                      isLoading = false;
                }),
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashboardScreen()) , (route) => false),
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value))),
                }
                });
              },
              child: Text('Login'),

            ),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => RegistrationPage()), (route) => false);
              },
              child: Text('Do not have an account? Register!'),
            ),
          ],
        ),
      ) : Center(child: CircularProgressIndicator(),),
    );
  }
}
