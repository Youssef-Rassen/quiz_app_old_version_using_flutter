import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
// void main(){
// runApp(MyApp());
// }

void main() => runApp(
    MyApp()); // shorthand function which have one and exactly one expression

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?', // String value
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ] // Object a value because it's a list.
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Monkey', 'score': 3},
        {'text': 'Lion', 'score': 11},
        {'text': 'Giraffe', 'score': 5},
        {'text': 'Tiger', 'score': 9}
      ]
    },
    {
      'questionText': 'Who\'s your favorite friend?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Joe', 'score': 1},
        {'text': 'Lea', 'score': 1},
        {'text': 'Maxima', 'score': 1}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore =0;
  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
  }
 void  _answerQuestion(int score,) {
    _totalScore+=score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Method

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Application'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    ); // MaterialApp is used to turn your Widgets into a real app that can be rendered
  }
}
/*Note:
1. If you want to write (What's) you have to write it as ------> 'What\'s for example:
      'What\'s your favorite color?'

2. in onPressed , the value of it needs a function ,but we do not pass the function,
 we pass its pointer to the onPressed function
 (We pass the name of the function NOT the result of this function)

3. we have our function:
  void answerQuestion(){
    print('Answer chosen!');
  }
we can pass it by using another way by using (anonymous function)
() =>print('Answer chosen!) OR (){
print ('Answer chosen')
};
instead of the function up there.

4. To access on list elements such as     var questions = [
      'What\'s your favorite color?',-----> index 0
      'What\'s your favorite animal?' ----> index 1
    ];
we make questions[0] to access the first question pr by using questions.elementAt(index)

5. We use questionIndex as a counter to get changed every time we answer a question,
 so the other question comes,but currently nothing will happen in the screen and that's because it's a
 Stateless Widget.

 6. setState is a function that it takes the thing that is going to change in this application its
 questionIndex, so the questions changes on every press on any answer and to make the screen reacts,
 we use setState function and StatefulWidget.
 ----> setState forces flutter to re-render the user-interface by calling the build method again

 7. The underscore in the name of MyAppState turns your class from its being a public class to be
 a private class (_MyAppState) and for now _MyAppState can now only be used by the main.dart file,
 so this class will be only accessed by this file only.
 also, we put _ before questionIndex to make it a private property only on this file.(_questionIndex).
 Let's do the same for answerQuestion.

8. To create a map we can use both {} or Map() it's a key-value collection
9. in line 31 , we created a list of Maps so the list contains key-value Map1 , key-value Map2 ,...etc
10. in line 54 we are accessing the map by referring to the question list index and the Key (questionText)
**LINE 55 ---> 57 AGAIN!** (Mapping List to Widget Video!!)
11. in line 55 we have a nested list list of children made by the column and a list of answers, so this makes a problem to dart
to prevent this we use a spread operators (3 dots) which have work that it pull all the values in this nested list and add them in the surrounding list
(Column list) as individual values so we do not add a list to a list but we add a value to a list with having only 1 list without nested list
12. _questionIndex < questions.length ? its a ternary expression in line 58 it means that if this condition is True then complete execute the Column
(:) means Else
 13. We  Split our Main file into quiz and result files to make the file more readable as clean code and clean widget trees.
 14.I found the solution for this as there are two thing need to check :-

1. In "Answer.dart" keep the selectHandler as VoidCallBack.

2. In "Quiz.dart" keep the answerQuestion as Function.

because in this we trying to pass argument from "main.dart" but not want to pass in "Answer.dart"
 file we will not change its Type for VoidCallBack to Function.
 if we are passing arguments, we should use Function, and when not, VoidCallback
 */
