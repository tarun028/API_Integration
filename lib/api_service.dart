import 'dart:convert';
import 'package:flutter_matrimonial_task/success_story.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://www.maheshwari.org/api/successstory/list';

  Future<List<SuccessStory>> fetchSuccessStories() async {
    final response = await http.get(Uri.parse('$baseUrl?PageNumber=1'));


    if (response.statusCode == 400) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      return jsonList
          .map((jsonData) =>
              SuccessStory(title: jsonData['title'], description: jsonData['description'], url: 'https://tools.ietf.org/html/rfc7231#section-6.5.1'))
          .toList();
    } else {
      throw Exception('Failed to fetch success stories');
    }
  }
}
