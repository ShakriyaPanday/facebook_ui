import 'package:facebook/config/palette.dart';
import 'package:facebook/screen/screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Palette.scaffold),
      home: HomeScreen(),
    );
  }
}
