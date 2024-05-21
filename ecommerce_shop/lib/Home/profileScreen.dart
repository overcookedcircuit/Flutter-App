import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../login/login.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String? email = user?.email;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('pfp.png'),
                ),
                SizedBox(height: 16),
                Text(
                  email ?? 'No email available',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Options'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('Country'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Order History'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Profile'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              _showChangePasswordDialog(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text('General', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text('Support'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: Icon(Icons.article_outlined),
            title: Text('Terms of Service'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle tap
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.xmark),
            title: Text('Logout'),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final TextEditingController currentPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final User? user = FirebaseAuth.instance.currentUser;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: currentPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                ),
              ),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                final currentPassword = currentPasswordController.text;
                final newPassword = newPasswordController.text;

                if (user != null) {
                  try {
                    final credential = EmailAuthProvider.credential(
                      email: user.email!,
                      password: currentPassword,
                    );
                    await user.reauthenticateWithCredential(credential);
                    await user.updatePassword(newPassword);

                    // Update the password in Firestore
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .update({'password': newPassword});

                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password updated successfully.'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } catch (error) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to update password: $error'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              },
              child: Text('Change'),
            ),
          ],
        );
      },
    );
  }
}
