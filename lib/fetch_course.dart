import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model/course.dart';

Future<Course> fetchCourse() async {
  final response =
      await http.get(Uri.parse('https://smsapp.bits-postman-lab.in/courses'));

  if (response.statusCode == 200) {
    return Course.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}
