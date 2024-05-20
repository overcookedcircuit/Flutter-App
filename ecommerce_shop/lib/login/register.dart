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
    print('Email exists: $emailExists');

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
        print('User created: ${user.uid}');
        // Add user details to Firestore using the user's UID as the document ID
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'password': pass,
        });

        // Show the Snackbar after the Firestore write operation completes
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User created successfully'),
            backgroundColor: Colors.greenAccent,
          ),
        );
      } else {
        print('User creation failed');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create user'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
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
        .collection('users')
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
