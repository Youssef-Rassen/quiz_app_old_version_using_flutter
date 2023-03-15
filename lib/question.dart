// This file holds my question widget.
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  @override
  Question(this.questionText);
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
//final means that this value will never changes after it's initialization.
