import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/Authentication/Login.dart';
// import 'package:flutter_complete_guide/Authentication/Register.dart';
import 'package:flutter_complete_guide/Course_screen/base_screen.dart';
import 'package:flutter_complete_guide/Home.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => BaseScreen())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage())));
    }
  }
}

class _AuthPageState extends State<AuthPage> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
    // return const Scaffold(
    //     // body: Center(
    //     // ),
    //     );
  }
}

// class _AuthPageState extends State<AuthPage> with WidgetsBindingObserver {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed && isUserLoggedIn()) {
//       // User is logged in, navigate to the landing screen
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => BaseScreen()),
//       );
//     }
//   }

//   // Method to check if the user is logged in
//   bool isUserLoggedIn() {
//     // ignore: todo
//     // TODO: Implement this method to check if the user is logged in
//     // Get the current user
//     final user = _auth.currentUser;
//     // Return true if the user is not null (logged in)
//     if (user != null) {
//       return true;
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: todo
//     // TODO: Return the login screen or the home screen depending on the user's login status
//     if (isUserLoggedIn()) {
//       // User is logged in, show the home screen
//       return BaseScreen();
//     } else {
//       // User is not logged in, show the login screen
//       return HomePage();
//     }
//   }

//   // // initially, show the login Page
//   // bool showLoginPage = true;

//   // @override
//   // Widget build(BuildContext context) {
//   //   if (showLoginPage) {
//   //     return LoginPage();
//   //   } else {
//   //     return RegisterPage();
//   //   }
//   // }

// }
