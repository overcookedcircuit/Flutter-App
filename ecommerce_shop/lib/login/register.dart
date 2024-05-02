import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/FireAuthService.dart';
import 'login.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final FirebaseAuthService _authentication = FirebaseAuthService();

  void _signUp() async {
    String email = _emailController.text;
    String pass = _passwordController.text;

    User? user = await _authentication.signUp(email, pass);
    if (user != null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User created successfully'),
          backgroundColor: Colors.greenAccent,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create user'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 25.0,),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 25.0,),
            ElevatedButton(onPressed: _signUp, child: Text("Create Account")),
          ],
        ),
      ),
    );
  }
}