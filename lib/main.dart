import 'package:flutter/material.dart';
import 'package:super_ops/view/home_section/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SuperOps',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
