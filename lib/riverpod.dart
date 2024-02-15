import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'model/course.dart';

final courseProvider = FutureProvider((ref) {
  return http.get(Uri.parse('https://smsapp.bits-postman-lab.in/courses')).then(
        (value) =>
            Course.fromJson(jsonDecode(value.body) as Map<String, dynamic>),
      );
});

final filterTextProvider = StateProvider<String>((ref) => '');

final departmentChoiceProvider = StateProvider<String>((ref) => '');

final yearChoiceProvider = StateProvider<String>((ref) => '');
