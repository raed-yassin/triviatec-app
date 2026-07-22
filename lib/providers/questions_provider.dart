import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:triviatec_app/providers/category_provider.dart';
import 'package:triviatec_app/utils/api.dart';

part 'questions_provider.g.dart';

@riverpod
Future<List<dynamic>> getQuestions(Ref ref) async {
  final homeSelectionInfo = ref.watch(selected);
  final questions = await fetchQuestions(
    category: homeSelectionInfo.category,
    difficulty: homeSelectionInfo.difficultyLevel,
    questionNumber: homeSelectionInfo.questionsNumber,
  );

  return questions['results'] ?? [];
}


@riverpod
class Score extends _$Score {
  @override
  int build() {
    return 0;
  }

  void correctAnswer() {
    state++;
    print(state);
  }

  void resetScore(){
    state =0;
  }
}


