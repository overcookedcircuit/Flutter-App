import 'package:flutter/material.dart';
import 'register.dart';
import 'package:ecommerce_shop/FireAuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:ecommerce_shop/Home/homePage.dart';

//This is the login page when a user has an account
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final FirebaseAuthService _authentication = FirebaseAuthService();

  void _signIn() async {
    String email = _emailController.text;
    String pass = _passwordController.text;

    User? user = await _authentication.signIn(email, pass);
    if (user != null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User logged in successfully'),
          backgroundColor: Colors.greenAccent,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(email: email)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to login'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _signIn,
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccountPage()),
                );// Navigate to Login Page
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}