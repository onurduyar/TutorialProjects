import 'package:flutter/material.dart';
import 'package:quiz_app/question_model.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var _questionIndex = 0;
  int _totalScore = 0;
  MaterialColor primary = Colors.blue;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      if (_questionIndex == 0) {
        switch (score) {
          case 5:
            primary = Colors.pink;
            break;
          case 4:
            primary = Colors.yellow;
            break;
          case 3:
            primary = Colors.green;
            break;
          case 2:
            primary = Colors.orange;
            break;
          default:
        }
      }
      _questionIndex += 1;
    });
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: primary),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first Page'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(
                totalScore: _totalScore,
                index: _questionIndex,
                resetHandler: resetQuiz,
              ),
      ),
    );
  }
}
