import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
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
                  backgroundImage: NetworkImage('Your_Image_URL_Here'),
                ),
                SizedBox(height: 16),
                Text(
                  'Ayush Patel',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'joy@augustin.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
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
              // Handle tap
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
            leading: Icon(Icons.people_outline),
            title: Text('Invite Friends'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // Handle tap
            },
          ),
        ],
      ),
    );
  }
}