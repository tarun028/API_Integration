import 'dart:convert';
import 'package:flutter_matrimonial_task/success_story.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://www.maheshwari.org/api/successstory/list';

  Future<List<SuccessStory>> fetchSuccessStories() async {
    final response = await http.get(Uri.parse('$baseUrl?PageNumber=X'));

    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      return jsonList
          .map((jsonData) =>
              SuccessStory(title: jsonData['title'], description: jsonData['description']))
          .toList();
    } else {
      throw Exception('Failed to fetch success stories');
    }
  }
}
