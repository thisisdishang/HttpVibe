// Write a program that'd return a list of author names who have written a book in Gujarati and English from API. Create an Author class.
// API (GET): https://raw.githubusercontent.com/SudipZluck/pod_player/master/test.json

import 'package:http/http.dart' as http;
import 'model.dart';

// // Testing API Response:-
// void main() async {
//   var url = Uri.parse(
//       'https://raw.githubusercontent.com/SudipZluck/pod_player/master/test.json');

//   var response = await http.get(url);

//   if (response.statusCode == 200) {
//     print(response.body);
//   } else {
//     print('Request failed with status: ${response.statusCode}');
//   }
// }

// Fetch authors who have written books in both Gujarati and English
Future<List<String>> fetchAuthors() async {
  final url = Uri.parse(
      'https://raw.githubusercontent.com/SudipZluck/pod_player/master/test.json');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // Decode JSON data using the modelFromJson function from model.dart
    List<Model> models = modelFromJson(response.body);

    List<String> authorsInBothLanguages = [];

    for (var model in models) {
      // Extract the author's name
      String authorName = model.authorDetails.name;

      // Extract the languages
      List<String> languages = [];
      for (var language in model.authorBookDetails.language) {
        languages.add(language.langName);
      }

      if (languages.contains('Gujarati') && languages.contains('English')) {
        authorsInBothLanguages.add(authorName);
      }
    }
    return authorsInBothLanguages;
  } else {
    print('Failed to load data with status ${response.statusCode}');
    return [];
  }
}

void main() async {
  List<String> authors = await fetchAuthors();

  if (authors.isNotEmpty) {
    print('Authors who have written books in both Gujarati and English:');
    for (var author in authors) {
      print(author);
    }
  } else {
    print(
        'No authors found who have written books in both Gujarati and English.');
  }
}
