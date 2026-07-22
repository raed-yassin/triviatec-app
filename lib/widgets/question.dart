import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triviatec_app/providers/category_provider.dart';
import 'package:triviatec_app/utils/classes.dart';
import 'package:triviatec_app/utils/colors.dart';
import 'package:triviatec_app/utils/enums.dart';
import 'package:triviatec_app/widgets/next_button.dart';

class Question extends ConsumerStatefulWidget {
  final String question;
  final String correct;
  final List<dynamic> incorrect;
  final int currentQuestion;
  final void Function(bool) onPressedButton;

  const Question({
    super.key,
    required this.question,
    required this.correct,
    required this.incorrect,
    required this.currentQuestion,
    required this.onPressedButton,
  });

  @override
  ConsumerState<Question> createState() => _QuestionState();
}

class _QuestionState extends ConsumerState<Question> {
  late List<QuestionAnswer> questionsList;
  late int correctIndex;
  int selectedIndex = -1;
  bool isAnswered = false;

  @override
  void initState() {
    super.initState();
    var correctAns = QuestionAnswer(
      answer: widget.correct,
      type: QuestionType.correct,
    );
    questionsList = [
      ...widget.incorrect.map(
        (ans) => QuestionAnswer(answer: ans, type: QuestionType.incorrect),
      ),
      correctAns,
    ];
    questionsList.shuffle();
    correctIndex = questionsList.indexOf(correctAns);
  }

  @override
  Widget build(BuildContext context) {
    final questionsNumber = ref.read(selected).questionsNumber;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              // padding: EdgeInsets.all(10),
              // color: primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${questionsNumber.toString()} / ${widget.currentQuestion + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              Uri.decodeComponent(widget.question),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight(600),
                color: Colors.white,
              ),
              // maxLines: 1,
            ),

            SizedBox(height: 30),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 15),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questionsList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: whiteColor,
                      // backgroundColor:   cardColor,
                      backgroundColor: !isAnswered
                          ? cardColor
                          : (correctIndex == index
                                ? correctColor
                                : selectedIndex == index
                                ? wrongColor
                                : cardColor),
                      overlayColor: primaryColor,
                    ),
                    onPressed: () {
                      if (isAnswered) return;
                      setState(() {
                        selectedIndex = index;
                        isAnswered = true;
                      });
                    },
                    child: Center(
                      child: Text(
                        Uri.decodeComponent(questionsList[index].answer),
                        // questionsList[index].answer,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 60),
            nextButton(
              onPressed: () {
                
                if (selectedIndex == -1) return;
                widget.onPressedButton(correctIndex == selectedIndex);
              },
            ),
          ],
        ),
      ),
    );
  }
}
