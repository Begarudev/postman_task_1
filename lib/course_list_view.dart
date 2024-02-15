import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postman_task_1/course_list_item.dart';
import 'package:postman_task_1/riverpod.dart';

import 'model/course.dart';

class CourseListView extends ConsumerWidget {
  const CourseListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(courseProvider);
    return courses.when(
        data: (data) {
          return ScrollableListView(data: data);
        },
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

class ScrollableListView extends ConsumerStatefulWidget {
  const ScrollableListView({
    super.key,
    required this.data,
  });

  final Course data;

  @override
  ConsumerState<ScrollableListView> createState() => _ScrollableListViewState();
}

class _ScrollableListViewState extends ConsumerState<ScrollableListView> {
  @override
  Widget build(BuildContext context) {
    final textInput = ref.watch(filterTextProvider);
    final List<CourseElement> courses;
    final departmentSelected = ref.watch(departmentChoiceProvider);
    final yearSelected = ref.watch(yearChoiceProvider);

    courses = widget.data.courses.where((element) {
      if (yearSelected.isNotEmpty && element.year != yearSelected) {
        return false;
      }
      if (departmentSelected.isNotEmpty &&
          element.department.name != departmentSelected) {
        return false;
      }
      if (textInput.isNotEmpty &&
          !(element.courseName.toLowerCase().contains(textInput) ||
              element.courseCode.toLowerCase().contains(textInput))) {
        return false;
      }
      return true;
    }).toList();

    return Expanded(
      child: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseListItem(
            courseList: courses,
            index: index,
          );
        },
      ),
    );
  }
}
