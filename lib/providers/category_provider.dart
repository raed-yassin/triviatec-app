import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:triviatec_app/utils/api.dart';
import 'package:triviatec_app/utils/classes.dart';

part 'category_provider.g.dart';

List<Category> categories = [];
final categoryProvider = FutureProvider<List<Category>>((ref) async {
  final result = await fetchCategories();

  return result;
});


final selected = StateProvider<HomeSelection>(
  (ref) =>
      HomeSelection(category: -2, difficultyLevel: 'easy', questionsNumber: 5),
);

@riverpod
String getCategoryName(Ref ref) {
  final categories = ref
      .watch(categoryProvider)
      .requireValue; // requireValue make  But if the provider is still loading or has an error, it throws an exception.
  final selectedindex = ref.watch(selected).category;

  final Category category = categories.firstWhere(
    (category) => category.id == selectedindex,
  );
  return category.name;
  //   return categories.when(
  //   data: (categories) {
  //     return categories
  //         .firstWhere((category) => category.id == selected)
  //         .name;
  //   },
  //   loading: () => '',
  //   error: (_, __) => '',
  // );
}
