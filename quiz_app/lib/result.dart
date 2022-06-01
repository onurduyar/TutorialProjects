import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {required this.index,
      required this.resetHandler,
      required this.totalScore,
      Key? key})
      : super(key: key);
  final VoidCallback resetHandler;
  final int? index;
  final int totalScore;

  String get resultPhase {
    String resultText;
    if (totalScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (totalScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (totalScore <= 16) {
      resultText = 'You are ... strange!';
    } else {
      resultText = 'You are so bad :(';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            MyText(text: resultPhase),
            MyText(text: 'Your total score : $totalScore'),
            ElevatedButton(
              onPressed: resetHandler,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
