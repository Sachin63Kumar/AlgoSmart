import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_complete_guide/Home.dart';
import 'package:flutter_complete_guide/Authentication/Login.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstNameController = TextEditingController();
  // final _mobileNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    // _mobileNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (_formKey.currentState!.validate() && passwordConfirmed()) {
      setState(() {
        changeButton = true;
      });
      // create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // add user details
      addUserDetails(
        _firstNameController.text.trim(),
        // int.parse(_mobileNumberController.text.trim()),
        _emailController.text.trim(),
      );
      // navigate to Loginpage.
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  Future addUserDetails(
    String firstName,
    String email,
    /*int mobileNumber */
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      // 'last name': ,
      'email': email,
      // 'Mobile Number': mobileNumber,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Register.png'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 250,
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _navigateToHomeScreen(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        label: Text(
                          "Back",
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff435cdc),
                            elevation: 0,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1000),
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
                        right: 190,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Column(
                      children: [
                        // Email or Phone Number

                        Container(
                          padding: EdgeInsets.only(
                            right: 280,
                          ),
                          child: Text(
                            'Name',
                            style: TextStyle(
                              color: Color.fromARGB(255, 227, 88, 88),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 40, 48, 76),
                              // border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: TextFormField(
                                controller: _firstNameController,
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
                                    return "Name cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        // Email or Phone Number

                        Container(
                          padding: EdgeInsets.only(
                            right: 280,
                          ),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              color: Color.fromARGB(255, 227, 88, 88),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
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
                                  // fillColor: Colors.white,
                                  // hoverColor: Colors.red,
                                  border: InputBorder.none,
                                  hintText: 'Type Here...',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 87, 95, 118),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),

                        // Password

                        Container(
                          padding: EdgeInsets.only(
                            right: 240,
                          ),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: Color.fromARGB(255, 227, 88, 88),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
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
                        SizedBox(
                          height: 35,
                        ),
                        //  Confirm Password

                        Container(
                          padding: EdgeInsets.only(
                            right: 170,
                          ),
                          child: Text(
                            'Confirm Password',
                            style: TextStyle(
                              color: Color.fromARGB(255, 227, 88, 88),
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 40, 48, 76),
                              // border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: TextFormField(
                                controller: _confirmpasswordController,
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
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 130.0),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: ElevatedButton(
                              onPressed: signUp,
                              // () {},
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
                                  padding: EdgeInsets.all(10),
                                  backgroundColor:
                                      Color.fromARGB(255, 59, 85, 210),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10000),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
