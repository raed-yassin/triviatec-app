import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triviatec_app/providers/category_provider.dart';
import 'package:triviatec_app/screens/questions.dart';
import 'package:triviatec_app/utils/colors.dart';
import 'package:triviatec_app/utils/api.dart';
import 'package:triviatec_app/widgets/appbar.dart';
import 'package:triviatec_app/widgets/next_button.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final _formKey = GlobalKey<FormState>();
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoryProvider);
    final homeSelectionInfo = ref.watch(selected);
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
                        categories.when(
                          loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },

                          error: (error, stackTrace) {
                            return Center(
                              child: Text(
                                error.toString(),
                                style: const TextStyle(color: Colors.red),
                              ),
                            );
                          },

                          data: (categories) {
                            return DropdownButtonFormField<int>(
                              dropdownColor: secondaryColor,
                              style: const TextStyle(color: Colors.white),

                              decoration: InputDecoration(
                                labelText: "Category",
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),

                              iconEnabledColor: Colors.white,

                              onChanged: (value) {
                                ref.read(selected.notifier).state.category =
                                    value ?? -1;
                              },

                              validator: (value) {
                                if (value == null) {
                                  return "Category is required";
                                }
                                return null;
                              },

                              items: categories.map((cat) {
                                return DropdownMenuItem<int>(
                                  value: cat.id,
                                  child: Text(cat.name),
                                );
                              }).toList(),
                            );
                          },
                        ),
                        // SizedBox(height: 15),
                        // Switch(
                        //   value: isDark,
                        //   onChanged: (value) => setState(() {
                        //     isDark = value;
                        //   }),
                        // ),
                        SizedBox(height: 15),
                        DropdownButtonFormField(
                          dropdownColor: secondaryColor,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
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
                          iconEnabledColor: Colors.white,

                          onChanged: (value) {
                            ref.read(selected.notifier).state.difficultyLevel =
                                value ?? 'easy';
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
                            ref.read(selected.notifier).state.questionsNumber =
                                value ?? 5;
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
                              category: homeSelectionInfo.category,
                              difficulty: homeSelectionInfo.difficultyLevel,
                              questionNumber: homeSelectionInfo.questionsNumber,
                            );

                            if (!context.mounted) return;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Questions(
                                  questions: questions['results'] ?? [],
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
