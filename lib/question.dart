// This file holds my question widget.
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  @override
  const Question(this.questionText, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
//final means that this value will never changes after it's initialization.
