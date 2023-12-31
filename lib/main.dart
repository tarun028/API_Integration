import 'package:flutter/material.dart';
import 'success_story.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Success Stories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SuccessStoryPage(),
    );
  }
}
