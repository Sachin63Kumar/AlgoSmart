import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/profile/components/body.dart';

// import 'coustom_nav_bar.dart';
// import 'enums.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Profile"),
        backgroundColor: Color.fromARGB(255, 59, 85, 210),
      ),
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
