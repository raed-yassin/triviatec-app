import 'package:flutter/material.dart';
import 'package:triviatec_app/utils/colors.dart';
import 'package:triviatec_app/widgets/appbar.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: Container(
        color: secondaryColor,
        width: double.infinity,
        child: Padding(padding: const EdgeInsets.all(18.0), child: Column(
          children: [
            Text("data")
          ],
        )),
      ),
    );
  }
}
