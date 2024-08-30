import 'package:flutter/material.dart';
import '../screens/input_page.dart';

void main() {
  runApp(const BMIAPP());
}

class BMIAPP extends StatelessWidget {
  const BMIAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BMIBody(),
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFFFFFFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
    );
  }
}
