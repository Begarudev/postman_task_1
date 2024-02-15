import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postman_task_1/course_list_view.dart';
import 'package:postman_task_1/model/course.dart';
import 'package:postman_task_1/riverpod.dart';
import 'package:postman_task_1/widgets/drop_down_menu.dart';

import 'search_field.dart';
//
// void main() => runApp(
//       DevicePreview(
//         // isToolbarVisible: false,
//         backgroundColor: Colors.black,
//
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(), // Wrap your app
//       ),
//     );

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final course = ref.watch(courseProvider).whenData((value) => value);
    List yearList = [
      '1st',
      '2nd',
      '2ndt',
      '3rd',
      '4th',
    ];
    List<String> departmentList = Department.values.map((e) => e.name).toList();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            color: Color(0xff001F3F),
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("assets/background_image.png"))),
        alignment: Alignment.center,
        padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.038,
            left: MediaQuery.of(context).size.width * 0.038,
            top: 50),
        child: Column(
          children: [
            const SearchField(),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  DropDownMenu(
                    list: departmentList,
                    hintText: "SelectDepartment",
                    choiceProvider: departmentChoiceProvider,
                  ),
                  DropDownMenu(
                    list: yearList,
                    hintText: "Select Year",
                    choiceProvider: yearChoiceProvider,
                  )
                ],
              ),
            ),
            switch (course) {
              AsyncData() => const CourseListView(),
              AsyncError() => const Text('Oops, something unexpected happened'),
              _ => const CircularProgressIndicator(),
            }
          ],
        ),
      ),
    );
  }
}
