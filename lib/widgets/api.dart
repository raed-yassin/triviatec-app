import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<dynamic> fetchQuestions({
  required String category,
  required String difficulty,
  int questionNumber = 5,
}) async {
  final url = Uri.parse(
    'https://opentdb.com/api.php'
    '?amount=$questionNumber'
    '&category=$category'
    '&difficulty=$difficulty'
    '&type=multiple'
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

Future<List<dynamic>> fetchCategories() async {
  final url = Uri.parse('https://opentdb.com/api_category.php');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = convert.jsonDecode(response.body);

    return jsonResponse['trivia_categories'];
  }

  throw Exception('Failed to load Categories');
}