import 'package:flutter/material.dart';
import 'package:ecommerce_shop/login/onBoardScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyCjCzgOjNIrDLGhlUi5CR74YqDE_2Pq8IA',
        appId: '1:264533350463:android:561c12dfe18993dbd6808a',
        messagingSenderId: '264533350463',
        projectId: 'flutterapp-dc065'
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardScreen(),
    );
  }
}


