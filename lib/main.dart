import 'package:flutter/material.dart';
import 'package:pushup_counter/homepage/homepage.dart';
import 'package:pushup_counter/pushup/pushuppage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/pushup' : (context) => PushUp(),
      },
    );
  }
}
