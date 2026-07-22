import 'package:triviatec_app/utils/enums.dart';

class QuestionAnswer {
  final String answer;
  final QuestionType type;

  const QuestionAnswer({required this.answer, required this.type});
}

class Category {
  final int id;
  final String name;

  const Category({required this.id, required this.name});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name']);
  }
}

class HomeSelection {
  int category;
  int questionsNumber;
  String difficultyLevel;

  HomeSelection({
    required this.category,
    required this.difficultyLevel,
    required this.questionsNumber,
  });
  
  HomeSelection copyWith({
    int? category,
    String? difficultyLevel,
    int? questionsNumber,
  }) {
    return HomeSelection(
      category: category ?? this.category,
      difficultyLevel: difficultyLevel ?? this.difficultyLevel,
      questionsNumber: questionsNumber ?? this.questionsNumber,
    );
  }
}
