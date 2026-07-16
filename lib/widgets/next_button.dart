import 'package:flutter/material.dart';
import 'package:triviatec_app/utils/colors.dart';

Widget nextButton({
  required final VoidCallback onPressed,
  String buttonText = "Next",
}) => TextButton(
  style: TextButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: whiteColor, // Text color
    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  onPressed: onPressed,
  child: Text(
    buttonText,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  ),
);








// old version
// TextButton(
//                             style: TextButton.styleFrom(
//     backgroundColor: primaryColor,
//     foregroundColor: whiteColor, // Text color
//     padding: const EdgeInsets.symmetric(
//       horizontal: 35,
//       vertical: 15,
//     ),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(12),
//     ),
//   ),
//   onPressed: () async {
//     if (!_formKey.currentState!.validate()) return;
//     // final questions = await getQuestions(
//     //       category: category,
//     //       difficulty: difficultyLevel,
//     //       questionNumber: questionsNumbers,
//     //     );
//     final questions = await fetchQuestions(
//       category: category,
//       difficulty: difficultyLevel,
//       questionNumber: questionsNumbers,
//     );

//     if (!context.mounted) return;

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Questions(questions: questions['results'] ?? [],),
//       ),
//     );
//   },
//   child: Text(
//     "Next",
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 20,
//     ),
//   ),

// ),

                        