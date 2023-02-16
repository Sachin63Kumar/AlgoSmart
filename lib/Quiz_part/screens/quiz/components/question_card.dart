import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Quiz_part/controllers/question_controller.dart';
import 'package:flutter_complete_guide/Quiz_part/models/Questions.dart';
import 'package:get/get.dart';
// import 'package:quiz_app/controllers/question_controller.dart';
// import 'package:quiz_app/models/Questions.dart';

import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 243, 245, 253),
        borderRadius: BorderRadius.circular(25),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: kBlackColor),
            ),
            SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              question.options.length,
              (index) => Option(
                index: index,
                text: question.options[index],
                press: () => _controller.checkAns(question, index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
