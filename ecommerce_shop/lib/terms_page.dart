import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms of Service',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Introduction',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Welcome to our app. By accessing or using our service, you agree to be bound by these terms of service. If you disagree with any part of the terms, you may not access the service.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              Text(
                '2. User Accounts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'When you create an account with us, you must provide us with information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the terms, which may result in immediate termination of your account.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              Text(
                '3. Termination',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'We may terminate or suspend access to our service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the terms.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              Text(
                '4. Governing Law',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'These terms shall be governed and construed in accordance with the laws of the country, without regard to its conflict of law provisions.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              Text(
                '5. Changes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'We reserve the right, at our sole discretion, to modify or replace these terms at any time. If a revision is material, we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16.0),
              Text(
                '6. Contact Us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'If you have any questions about these terms, please contact us.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
