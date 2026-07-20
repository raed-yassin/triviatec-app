import 'package:flutter/material.dart';
import 'package:triviatec_app/screens/Results.dart';
import 'package:triviatec_app/utils/colors.dart';
import 'package:triviatec_app/widgets/appbar.dart';
import 'package:triviatec_app/widgets/question.dart';

class Questions extends StatefulWidget {
  final dynamic questions;
  const Questions({
    super.key,
    required this.questions,
  });

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  late dynamic questionsList;
  int score = 0;
  int currentQuestion = 0;

  @override
  void initState() {
    super.initState();
    questionsList = widget.questions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: Container(
        color: secondaryColor,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              // Question(question: "Hello in this question",correct: "Correct Correct", incorrect: ["Incorrect","Incorrect","Incorrect"],),
              Question(
                key: ValueKey(currentQuestion),
                question: questionsList[currentQuestion]["question"] ?? '',
                correct: questionsList[currentQuestion]["correct_answer"] ?? '',
                incorrect: List<String>.from(
                  questionsList[currentQuestion]["incorrect_answers"] ?? [],
                ),
                currentQuestion: currentQuestion,
                onPressedButton: onPressedButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressedButton(bool correctAnswer) {
    if (correctAnswer) {
      setState(() {
        score++;
      });
    }
    if (currentQuestion >= questionsList.length - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Results(
            score: score,
          ),
        ),
      );
    } else {
      setState(() {
        currentQuestion++;
      });
    }
  }
}
