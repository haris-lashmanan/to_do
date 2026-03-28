import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/utils/constants/constants.dart';

class ApiCalls {
  static final ApiCalls _instance = ApiCalls._internal();

  factory ApiCalls() => _instance;

  ApiCalls._internal();

  final String _baseUrl = Constants.baseUrl;

  Future<dynamic> getToDoList() async {
    final response = await http.get(
      Uri.parse('${_baseUrl}todos/'),
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        'Accept': '*/*',
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
