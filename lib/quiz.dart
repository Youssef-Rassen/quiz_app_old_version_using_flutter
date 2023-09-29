import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  const Quiz(
      {super.key, required this.questions,
      required this.answerQuestion,
      required this.questionIndex});
// required here means that all these values are needed and we cannot omit one of them
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers'] as List<
                Map<String,Object>>) // we used as List<String> because Dart couldn't detect that 'answers' is a LIST inside the map
            .map((answer) {
          return Answer(()=>answerQuestion(answer['score']),
              answer['text']as String); //_answerQuestion is the handler (pointer) that points on the next question, and answer is the answerText we have in Answer class
        }).toList() // .toList() is used to tell dart that we want a list not a map or anything else
      ],
    );
  }
}
