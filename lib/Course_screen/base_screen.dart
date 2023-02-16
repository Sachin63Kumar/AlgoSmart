// import 'package:first_app/constants/color.dart';
// import 'package:first_app/constants/icons.dart';
// import 'package:first_app/constants/size.dart';
import 'package:flutter_complete_guide/Course_screen/feature_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_complete_guide/Own_linearSearch.dart';
import 'package:flutter_complete_guide/Quiz_part/quiz_main.dart';
// import 'package:flutter_complete_guide/main_screen.dart';
import 'package:flutter_complete_guide/practice_screen.dart';
// import 'package:flutter_complete_guide/pdf_one.dart';
import 'package:flutter_complete_guide/profile/profile_screen.dart';
import 'package:flutter_complete_guide/Resources/resource_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    FeaturedScreen(),
    PracticeScreen(),
    QuizMainScreen(),
    ResourceScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 59, 85, 210),
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/play.png',
              height: 24.0,
            ),
            icon: Image.asset(
              'assets/play_n_out.png',
              height: 24.0,
            ),
            label: "Learning",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/practice_out.png',
              height: 24.0,
            ),
            icon: Image.asset(
              'assets/practice_out.png',
              height: 24.0,
            ),
            label: "Practice",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/test_out.png',
              height: 24.0,
            ),
            icon: Image.asset(
              'assets/test_out.png',
              height: 24.0,
            ),
            label: "Test",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/resource_out.png',
              height: 24.0,
            ),
            icon: Image.asset(
              'assets/resource_out.png',
              height: 24.0,
            ),
            label: "Resources",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/profile_out.png',
              height: 24.0,
            ),
            icon: Image.asset(
              'assets/profile_out.png',
              height: 24.0,
            ),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
