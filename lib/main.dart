// ignore_for_file: prefer_const_constructors
import 'package:al_quran_app_flutter/screens/starter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "QuranApp",
        home: StarterScreen());
  }
}
