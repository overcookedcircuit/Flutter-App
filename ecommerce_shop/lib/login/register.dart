import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/FireAuthService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final FirebaseAuthService _authentication = FirebaseAuthService();

  Future<void> _signUp() async {
    String email = _emailController.text;
    String pass = _passwordController.text;

    // Check if the email already exists in Firestore
    bool emailExists = await _checkIfEmailExists(email);

    if (emailExists) {
      // If the email exists, show a Snackbar and return
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email already exists. Please use a different email.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // If the email does not exist, proceed with user creation
    try {
      User? user = await _authentication.signUp(email, pass);
      if (user != null) {
        // Add user details to Firestore
        await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
          'email': email,
          'password': pass,
        });

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
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  // Function to check if the email already exists in Firestore
  Future<bool> _checkIfEmailExists(String email) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty;
  }

  @override
  void dispose() {
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
              decoration: InputDecoration(labelText: "email"),
            ),
            SizedBox(height: 25.0,),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "password"),
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
