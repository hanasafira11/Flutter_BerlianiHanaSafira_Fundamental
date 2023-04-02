import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // untuk hide banner debug
        home: SafeArea(
            child: Scaffold(
                appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.deepOrangeAccent,
        ))));
  }
}
