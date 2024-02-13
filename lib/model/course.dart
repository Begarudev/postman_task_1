import 'dart:convert';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

class Course {
  final List<CourseElement> courses;

  Course({
    required this.courses,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        courses: List<CourseElement>.from(
            json["courses"].map((x) => CourseElement.fromJson(x))),
      );
}

class CourseElement {
  final Department department;
  final String year;
  final String courseCode;
  final String courseName;

  CourseElement({
    required this.department,
    required this.year,
    required this.courseCode,
    required this.courseName,
  });

  factory CourseElement.fromJson(Map<String, dynamic> json) => CourseElement(
        department: departmentValues.map[json["department"]]!,
        year: json["year"],
        courseCode: json["courseCode"],
        courseName: json["courseName"],
      );
}

enum Department { Computer_Science, Electronics, Mechanical }

final departmentValues = EnumValues({
  "CS": Department.Computer_Science,
  "Elec.": Department.Electronics,
  "Mech.": Department.Mechanical
});

class EnumValues<T> {
  Map<String, T> map;
  // late Map<T, String> reverseMap;

  EnumValues(this.map);
}
