import 'package:flutter/material.dart';
import 'package:triviatec_app/screens/questions.dart';
import 'package:triviatec_app/utils/colors.dart';
import 'package:triviatec_app/widgets/api.dart';
import 'package:triviatec_app/widgets/appbar.dart';
import 'package:triviatec_app/widgets/next_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int questionsNumber = 5;
  String difficultyLevel = 'easy';
  String category = '1';
  List categories = [];

  final _formKey = GlobalKey<FormState>();

  Future<void> loadCategories() async {
    final result = await fetchCategories();

    setState(() {
      categories = result;
    });
  }

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: Container(
        color: secondaryColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Container(
                color: secondaryColor,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome to the Trivia App",
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(height: 40),
                        DropdownButtonFormField(
                          dropdownColor: secondaryColor, // خلفية القائمة
                          style: const TextStyle(
                            color: Colors.white,
                          ), // النص المختار

                          decoration: InputDecoration(
                            labelText: "Category",
                            labelStyle: const TextStyle(color: Colors.white),

                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          iconEnabledColor: Colors.white, // السهم

                          onChanged: (value) => setState(() {
                            category = value.toString();
                          }),
                          validator: (value) {
                            if (value == null) {
                              return "Category is required";
                            }
                          },
                          items: categories
                              .map(
                                (cat) => DropdownMenuItem(
                                  value: cat['id'].toString(),
                                  child: Text(cat['name']),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 15),
                        DropdownButtonFormField(
                          dropdownColor: secondaryColor, // خلفية القائمة
                          style: const TextStyle(
                            color: Colors.white,
                          ), // النص المختار

                          decoration: InputDecoration(
                            labelText: "Difficulty",
                            labelStyle: const TextStyle(color: Colors.white),

                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          iconEnabledColor: Colors.white, // السهم

                          onChanged: (value) {
                            setState(() {
                              difficultyLevel = value ?? 'easy';
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Difficulty is required";
                            }
                          },

                          // initialSelection: 'easy',
                          items: [
                            DropdownMenuItem(
                              value: "easy",
                              child: Text("Easy"),
                            ),
                            DropdownMenuItem(
                              value: "medium",
                              child: Text("Medium"),
                            ),
                            DropdownMenuItem(
                              value: "hard",
                              child: Text("Hard"),
                            ),

                            // DropdownMenuEntry(value: "easy", label: "Easy"),
                            // DropdownMenuEntry(value: "medium", label: "Medium"),
                            // DropdownMenuEntry(value: "hard", label: "Hard"),
                          ],
                        ),
                        SizedBox(height: 15),
                        DropdownButtonFormField(
                          dropdownColor: secondaryColor, // خلفية القائمة
                          style: const TextStyle(
                            color: Colors.white,
                          ), // النص المختار

                          decoration: InputDecoration(
                            labelText: "Questions Number",
                            labelStyle: const TextStyle(color: Colors.white),

                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          iconEnabledColor: Colors.white, // السهم

                          onChanged: (value) {
                            setState(() {
                              questionsNumber = value ?? 5;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return "Number is required";
                            }
                          },
                          items: [
                            DropdownMenuItem(value: 3, child: Text("3")),
                            DropdownMenuItem(value: 5, child: Text("5")),
                            DropdownMenuItem(value: 10, child: Text("10")),
                            DropdownMenuItem(value: 15, child: Text("15")),
                            DropdownMenuItem(value: 20, child: Text("20")),
                            DropdownMenuItem(value: 25, child: Text("25")),
                            DropdownMenuItem(value: 30, child: Text("30")),
                          ],
                        ),
                        SizedBox(height: 55),
                        nextButton(
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;
                            final questions = await fetchQuestions(
                              category: category,
                              difficulty: difficultyLevel,
                              questionNumber: questionsNumber,
                            );

                            if (!context.mounted) return;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Questions(
                                  questions: questions['results'] ?? [],
                                  difficultyLevel: difficultyLevel,
                                  questionsNumber: questionsNumber,
                                  category: category,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
