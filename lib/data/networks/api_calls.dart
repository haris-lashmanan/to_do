import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/utils/constants/constants.dart';

class ApiCalls {
  static final ApiCalls _instance = ApiCalls._internal();

  factory ApiCalls() => _instance;

  ApiCalls._internal();

  final String _baseUrl = Constants.baseUrl;

  Future<dynamic> getToDoList() async {
    final response = await http.get(Uri.parse('${_baseUrl}todos/'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
