import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:triviatec_app/utils/classes.dart';

Future<dynamic> fetchQuestions({
  required int category,
  required String difficulty,
  int questionNumber = 5,
}) async {
  final url = Uri.parse(
    'https://opentdb.com/api.php'
    '?amount=$questionNumber'
    '&category=$category'
    '&difficulty=$difficulty'
    '&type=multiple',
    // 'encode=url3986',
  );
  // '&encode=url3986',

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // Parse JSON
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    return jsonResponse;
  }

  throw Exception('Failed to load questions');
}
// Future<dynamic> fetchCategories() async {
//   final url = Uri.parse(
//     'https://opentdb.com/api_category.php'
//   );

//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     // Parse JSON
//     var jsonResponse =
//         convert.jsonDecode(response.body);
//     return jsonResponse.trivia_categories;
//   }

//   throw Exception('Failed to load Categories');
// }

Future<List<Category>> fetchCategories() async {
  final url = Uri.parse('https://opentdb.com/api_category.php');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);

    final categoriesJson = jsonResponse['trivia_categories'] as List;

    return categoriesJson.map((json) => Category.fromJson(json)).toList();
  }

  throw Exception('Failed to load Categories');
}
