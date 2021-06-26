import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peacehouse_app/authprovider/auth_provider.dart';

import 'loginmain.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  TextEditingController _emailController = new TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Reset Account')
      ),
      body: isLoading == false ? Padding(
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
            MaterialButton(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                AuthClass().resetPassword(email: _emailController.text.trim(),).then((value) => {
                  if (value == 'Email sent') {
                    setState(() {
                      isLoading = false;
                    }),
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()) , (route) => false),
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value))),
                  }
                });
              },
              child: Text('Reset Account'),

            ),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
              },
              child: Text('Already have an account? Login!'),
            ),
          ],
        ),
      ) : Center(child: CircularProgressIndicator(),)
    );
  }
}
