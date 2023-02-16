import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link sent: Check your email"),
            );
          });
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 153, 204, 244),
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   elevation: 0,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock,
            size: 100,
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Enter your Email for getting password reset link",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),

          SizedBox(height: 20),
          // email Textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 217, 255),
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
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 87, 95, 118),
                    ),
                  ),
                ),
                // child: TextField(
                //   controller: _emailController,
                //   style: TextStyle(
                //     color: Colors.white,
                //   ),
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     hintText: 'Email',
                //     hintStyle: TextStyle(
                //       color: Color.fromARGB(255, 87, 95, 118),
                //     ),
                //   ),
                // ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0),
            child: Container(
              padding: EdgeInsets.all(2),
              child: ElevatedButton(
                onPressed: passwordReset,
                //() {
                //   _navigateToBaseScreen(context);
                // },
                child: Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    backgroundColor: Color.fromARGB(255, 59, 85, 210),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10000),
                    )),
              ),
            ),
          ),
          // MaterialButton(
          //   onPressed: passwordReset,
          //   child: Text(
          //     "Reset Password",
          //   ),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(1000),
          //   ),
          //   color: Colors.deepPurple[200],
          // )
        ],
      ),
    );
  }
}
