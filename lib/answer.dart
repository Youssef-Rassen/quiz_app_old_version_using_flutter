import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler,this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
       child:ElevatedButton(onPressed: selectHandler, child: Text(answerText)),

    );
  }
}
//Function(VoidCallBack) means that we refer to a function using the name of selectHandler
// VoidCallBack doesn't take any input and doesn't return any values(Void function)
//Function will be used if it takes an input or return anything.

