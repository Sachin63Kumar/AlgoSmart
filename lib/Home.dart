// import 'dart:html';

import 'package:flutter_complete_guide/Authentication/Login.dart';
import 'package:flutter_complete_guide/Authentication/Register.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _navigateToLoginScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void _navigateToRegisterScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/HOME.png'), fit: BoxFit.cover)),
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: [
              Container(
                padding: EdgeInsets.only(top: 190),
                child: Text(
                  'Learn | Practice | Test',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(height: 360),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130.0),
                child: Container(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      _navigateToLoginScreen(context);
                    },
                    child: Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: Color.fromARGB(255, 59, 85, 210),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10000),
                        )),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              // Register page

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130.0),
                child: Container(
                  padding: EdgeInsets.all(2),
                  child: ElevatedButton(
                    onPressed: () {
                      _navigateToRegisterScreen(context);
                    },
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: Color.fromARGB(255, 59, 85, 210),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10000),
                        )),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 150.0),
              //   child: Container(
              //     padding: EdgeInsets.all(15),
              //     decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 59, 85, 210),
              //       borderRadius: BorderRadius.circular(10000),
              //     ),
              //     child: Center(
              //         child: Text(
              //       'Log In',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20,
              //       ),
              //     )),
              //   ),
              // ),
            ])),
          ),
        ),
      ),
    );
  }
}
