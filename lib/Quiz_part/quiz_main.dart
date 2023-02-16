import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Quiz_part/screens/welcome/welcome_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class QuizMainScreen extends StatelessWidget {
  const QuizMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}
