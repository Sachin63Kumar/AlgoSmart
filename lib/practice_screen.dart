// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/Course_screen/circle_button.dart';
// import 'package:flutter_complete_guide/Course_screen/feature_screen.dart';
import 'package:flutter_complete_guide/Course_screen/search_testfield.dart';
// import 'package:flutter_complete_guide/Resources/pdf_five.dart';
// import 'package:flutter_complete_guide/Resources/pdf_four.dart';
import 'package:flutter_complete_guide/Resources/pdf_one.dart';
// import 'package:flutter_complete_guide/Resources/pdf_three.dart';

import '../Course_screen/base_screen.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              AppBar1(),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  // ignore: unused_element
  void _navigateToBaseScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BaseScreen()));
  }

  void _navigateToPdfone(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PdfScreenone()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: []);
  }
}

class AppBar1 extends StatelessWidget {
  const AppBar1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color.fromARGB(255, 92, 114, 223),
            Color.fromARGB(255, 59, 85, 210),
          ],
        ),
      ),
      child: Column(
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Practice",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchTextField()
        ],
      ),
    );
  }
}
