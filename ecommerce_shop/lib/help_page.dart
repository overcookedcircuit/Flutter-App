import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'For support, you can reach us at:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: support@example.com',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Phone: +1 234 567 890',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Address: 1234 Support St, Help City, CA 12345',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Support Hours:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8.0),
            Text(
              'Monday - Friday: 9:00 AM - 5:00 PM',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Saturday: 10:00 AM - 4:00 PM',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Sunday: Closed',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
