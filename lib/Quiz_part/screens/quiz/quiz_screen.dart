import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Quiz_part/controllers/question_controller.dart';
import 'package:flutter_complete_guide/Quiz_part/screens/quiz/components/body.dart';
import 'package:get/get.dart';
// import 'package:quiz_app/controllers/question_controller.dart';

// import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Color.fromARGB(255, 27, 37, 67),
        elevation: 0,
        actions: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: _controller.nextQuestion,
              label: Text("Skip"),
              icon: Icon(Icons.arrow_back),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 27, 37, 67),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10000),
                  )),
            ),
          ),

          // ElevatedButton(
          //   onPressed: _controller.nextQuestion,
          //   //() {
          //   //   _navigateToBaseScreen(context);
          //   // },
          //   child: Center(
          //     child: Text(
          //       'Skip',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20,
          //       ),
          //     ),
          //   ),
          //   style: ElevatedButton.styleFrom(
          //       padding: EdgeInsets.all(15),
          //       backgroundColor: Color.fromARGB(255, 59, 85, 210),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10000),
          //       )),
          // ),

          // ElevatedButton(
          //     onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
      ),
      body: Body(),
    );
  }
}
