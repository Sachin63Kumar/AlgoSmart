// import 'dart:html';
// import 'package:flutter_complete_guide/base_screen.dart';
// import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_complete_guide/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Course_screen/base_screen.dart';

import 'forgot_pw_page.dart';
// import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  Future signIn() async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          changeButton = true;
        });
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                    "You have login Successfully! Click on screen to enter into the Course screen"),
              );
            });
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BaseScreen()));
        // await Future.delayed(Duration(seconds: 1));
        // await Navigator.pushNamed(context, MyRoutes.homeRoute);
        setState(() {
          changeButton = false;
        });
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
    // if (_formKey.currentState!.validate()) {
    //   setState(() {
    //     changeButton = true;
    //   });
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: _emailController.text.trim(),
    //     password: _passwordController.text.trim(),
    //   );
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => BaseScreen()));
    //   // await Future.delayed(Duration(seconds: 1));
    //   // await Navigator.pushNamed(context, MyRoutes.homeRoute);
    //   setState(() {
    //     changeButton = false;
    //   });
    // }
    // await FirebaseAuth.instance.signInWithEmailAndPassword(
    //   email: _emailController.text.trim(),
    //   password: _passwordController.text.trim(),
    // );
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (context) => BaseScreen()));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  // void _navigateToBaseScreen(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => BaseScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Login.png'), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            // backgroundColor: Colors.grey[300],
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 250,
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _navigateToHomeScreen(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        label: Text("Back"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff435cdc),
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10000),
                            )),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Padding(padding: EdgeInsets.only(top: 35, left: 16)),
                    //     CircleAvatar(
                    //       radius: 20,
                    //       backgroundColor: Color(0xff435cdc),
                    //       child: IconButton(
                    //         color: Colors.white,
                    //         onPressed: () {
                    //           _navigateToHomeScreen(context);
                    //         },
                    //         icon: Icon(
                    //           Icons.arrow_back,
                    //         ),
                    //       ),
                    //     ),
                    //     Text(
                    //       "Back",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20,
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Login

                    Padding(
                      padding: EdgeInsets.only(
                        right: 200,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Column(children: [
                      SizedBox(height: 50),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'You\'ve been Missed!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 240),
                    ]),

                    // Email Text Field
                    // SingleChildScrollView(

                    SingleChildScrollView(
                      child: Container(
                        // color: Color.fromARGB(255, 27, 37, 67),
                        // padding: EdgeInsets.only(right: 10, left: 10),
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.only(
                              right: 280,
                            ),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: Color.fromARGB(255, 227, 88, 88),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 40, 48, 76),
                                // border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: TextFormField(
                                  controller: _emailController,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Type Here...',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 87, 95, 118),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Username cannot be empty";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    name = value;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                          // password text Field
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              right: 240,
                            ),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                color: Color.fromARGB(255, 227, 88, 88),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 28.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 40, 48, 76),
                                // border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: TextFormField(
                                  controller: _passwordController,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Type Here...',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 87, 95, 118),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password cannot be empty";
                                    } else if (value.length < 6) {
                                      return "Password length should be greater than 6";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 8),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ForgotPasswordPage();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 18,
                          ),
                          // Login BUtton
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 150.0),
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 130.0),
                            child: Container(
                              padding: EdgeInsets.all(2),
                              child: ElevatedButton(
                                onPressed: signIn,
                                //() {
                                //   _navigateToBaseScreen(context);
                                // },
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
                                    padding: EdgeInsets.all(15),
                                    backgroundColor:
                                        Color.fromARGB(255, 59, 85, 210),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10000),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ]),
                      ),
                    ),
                  ]),
                ),
              ),
            )));
  }
} 
    
    
    
//     Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/home1.png'), fit: BoxFit.cover)),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Column(
//           children: [
//             RaisedButton(
//               child: Text('Login'),
//               onpressed
//             ),

//             Container(
//               padding: EdgeInsets.only(left: 105, top: 200),
//               child: Text(
//                 'Learn | Practice | Test',
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//               ),
//             ),
//             Container(
//               child: Text("Login",                    
//               style: ,),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// class _MyLoginState extends State<MyLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/home1.png'), fit: BoxFit.cover)),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 105, top: 200),
//               child: Text(
//                 'Learn | Practice | Test',
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextField(
//                             style: TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Email",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           TextField(
//                             style: TextStyle(),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Password",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Sign in',
//                                 style: TextStyle(
//                                     fontSize: 27, fontWeight: FontWeight.w700),
//                               ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: Color(0xff4c505b),
//                                 child: IconButton(
//                                     color: Colors.white,
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.arrow_forward,
//                                     )),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, 'register');
//                                 },
//                                 child: Text(
//                                   'Sign Up',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Color(0xff4c505b),
//                                       fontSize: 18),
//                                 ),
//                                 style: ButtonStyle(),
//                               ),
//                               TextButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     'Forgot Password',
//                                     style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Color(0xff4c505b),
//                                       fontSize: 18,
//                                     ),
//                                   )),
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
