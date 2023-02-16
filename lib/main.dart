// import 'package:first_app/Home.dart';
// import 'package:flutter_complete_guide/Home.dart';
// import 'package:flutter_complete_guide/base_screen.dart';
// import 'package:first_app/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_complete_guide/Course_screen/base_screen.dart';
import 'package:flutter_complete_guide/Home.dart';
import 'package:flutter_complete_guide/auth/auth_page.dart';
// import 'package:flutter_complete_guide/auth/auth_page.dart';
// import 'package:flutter_complete_guide/Quiz_part/quiz_main.dart';
// import 'package:flutter_complete_guide/auth/main_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AuthPage(),
      home: HomePage(),
    );
  }
}
