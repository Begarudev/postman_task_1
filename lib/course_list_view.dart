import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postman_task_1/course_list_item.dart';
import 'package:postman_task_1/model/course.dart';
import 'package:postman_task_1/riverpod.dart';

class CourseListView extends ConsumerStatefulWidget {
  const CourseListView(
    this._courseList, {
    Key? key,
  }) : super(key: key);

  final List<CourseElement> _courseList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CourseListViewState();
}

class _CourseListViewState extends ConsumerState<CourseListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _loadData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadData();
    }
  }

  void _loadData() async {
    try {
      final course = await ref.read(courseProvider.future);
      setState(() {
        widget._courseList.addAll(course.courses);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading more data: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      itemCount: widget._courseList.length,
      itemBuilder: (context, index) {
        return CourseListItem(
          courseList: widget._courseList,
          index: index,
        );
      },
    );
  }
}
