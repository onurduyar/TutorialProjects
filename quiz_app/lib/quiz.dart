import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<dynamic, dynamic>> questions;
  final Function answerQuestion;
  final int questionIndex;

  const Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) => Answer(() => answerQuestion(answer['score']),
                answer['text'] as String))
            .toList()
      ],
    );
  }
}
