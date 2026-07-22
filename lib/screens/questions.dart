import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:triviatec_app/providers/questions_provider.dart';
import 'package:triviatec_app/screens/Results.dart';
import 'package:triviatec_app/utils/colors.dart';
import 'package:triviatec_app/widgets/appbar.dart';
import 'package:triviatec_app/widgets/question.dart';

class Questions extends ConsumerStatefulWidget {
  const Questions({super.key});

  @override
  ConsumerState<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends ConsumerState<Questions> {
  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    final questionsList = ref.watch(getQuestionsProvider);
    return Scaffold(
      appBar: header(),
      body: questionsList.when(
        data: (questionsList) {
          return Container(
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
                    correct:
                        questionsList[currentQuestion]["correct_answer"] ?? '',
                    incorrect: List<String>.from(
                      questionsList[currentQuestion]["incorrect_answers"] ?? [],
                    ),
                    currentQuestion: currentQuestion,
                    onPressedButton: onPressedButton,
                  ),
                ],
              ),
            ),
          );
        },
        error: (e, s) => Text(e.toString()),
        loading: () => Container(
          color: secondaryColor,
          width: double.infinity,
          height: double.infinity,
          child: Center(child: const CircularProgressIndicator()),
        ),
      ),
    );
  }

  void onPressedButton(bool correctAnswer) {
    final questionsList = ref.watch(getQuestionsProvider).requireValue;
    if (correctAnswer) {
      ref.watch(scoreProvider.notifier).correctAnswer();
    }
    if (currentQuestion >= questionsList.length - 1) {
      context.pushNamed('result');
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Results()),
      // );
    } else {
      setState(() {
        currentQuestion++;
      });
    }
  }
}
