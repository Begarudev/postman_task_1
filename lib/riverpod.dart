import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

import 'model/course.dart';

final courseProvider = FutureProvider.autoDispose<Course>((ref) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response =
      await http.get(Uri.parse('https://smsapp.bits-postman-lab.in/courses'));
  // Using dart:convert, we then decode the JSON payload into a Map data structure.

  if (response.statusCode == 200) {
    return Course.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
  // final json = jsonDecode(response.body) as Map<String, dynamic>;
  // // Finally, we convert the Map into an Activity instance.
  // return Course.fromJson(json);
});
