
import 'package:flutter/material.dart';
import 'package:triviatec_app/screens/home.dart';
import 'package:triviatec_app/utils/colors.dart';
import 'package:triviatec_app/widgets/appbar.dart';
import 'package:triviatec_app/widgets/next_button.dart';

class Results extends StatelessWidget {
  final int score;
  final int questionsNumber;
  final String difficultyLevel;
  final String category;

  const Results({
    super.key,
    required this.score,
    required this.category,
    required this.difficultyLevel,
    required this.questionsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      
      body: Container(
        color: secondaryColor,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("The Results",style: TextStyle(),),
              SizedBox(height: 10,),
              Text("Your Score $score out of $questionsNumber",style: TextStyle(),),
              SizedBox(height: 10,),
              Text("Category $category",style: TextStyle(),),
              SizedBox(height: 10,),
              Text("Difficulty: $difficultyLevel",style: TextStyle(),),
              SizedBox(height: 30,),
              nextButton(
                buttonText: "PLAY AGAIN",
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
