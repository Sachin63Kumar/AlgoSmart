// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/Course_screen/circle_button.dart';
// import 'package:flutter_complete_guide/Course_screen/feature_screen.dart';
import 'package:flutter_complete_guide/Course_screen/search_testfield.dart';
import 'package:flutter_complete_guide/Resources/pdf_five.dart';
import 'package:flutter_complete_guide/Resources/pdf_four.dart';
import 'package:flutter_complete_guide/Resources/pdf_one.dart';
import 'package:flutter_complete_guide/Resources/pdf_three.dart';

import '../Course_screen/base_screen.dart';

class ResourceScreen extends StatefulWidget {
  const ResourceScreen({Key? key}) : super(key: key);

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
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
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: EdgeInsets.only(top: 30, right: 5, left: 5, bottom: 5),
          child: ElevatedButton(
            onPressed: () {
              _navigateToPdfone(context);
            },
            child: Center(
              child: Text(
                'Searching And Sorting',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 59, 85, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),

      // SizedBox(
      //   height: 10,
      // ),
      // Register page

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              // _navigateToLoginScreen(context);
            },
            child: Center(
              child: Text(
                'Array List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 59, 85, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PdfScreenthree()));
            },
            child: Center(
              child: Text(
                'Linked List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 59, 85, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PdfScreenfour()));
            },
            child: Center(
              child: Text(
                'Stack',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 59, 85, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PdfScreenfive()));
            },
            child: Center(
              child: Text(
                'Queue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 59, 85, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              // _navigateToLoginScreen(context);
            },
            child: Center(
              child: Text(
                'Priority Queue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 59, 85, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              // _navigateToLoginScreen(context);
            },
            child: Center(
              child: Text(
                'Trees',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 59, 85, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              // _navigateToLoginScreen(context);
            },
            child: Center(
              child: Text(
                'Heap',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 59, 85, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              // _navigateToLoginScreen(context);
            },
            child: Center(
              child: Text(
                'Array List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 59, 85, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Container(
          padding: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              // _navigateToLoginScreen(context);
            },
            child: Center(
              child: Text(
                'Array List',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Color.fromARGB(255, 59, 85, 210),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),
    ]);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Notes &\nCodes",
                style: Theme.of(context).textTheme.titleLarge,
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
