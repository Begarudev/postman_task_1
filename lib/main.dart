import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postman_task_1/course_list_view.dart';
import 'package:postman_task_1/riverpod.dart';

import 'model/course.dart';
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
      title: 'Flutter Demo',
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

  // late Future<Course> futureCourse;

  // late List<CourseElement> filteredList;

  @override
  Widget build(BuildContext context, ref) {
    final list
    void Function(String) onChanged = ;
    final AsyncValue<Course> course = ref.watch(courseProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xff001F3F),
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/background_image.png"))),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.038,
                    vertical: 50),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: ShapeDecoration(
                            color: const Color.fromRGBO(65, 105, 225, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        child: SearchField(
                            courses: , onChanged: onChanged,),
                      ),
                    ),
                    switch (course) {
                      AsyncData(:final value) => CourseListView(value.courses),
                      AsyncError() =>
                        const Text('Oops, something unexpected happened'),
                      _ => const CircularProgressIndicator(),
                    }
                  ],
                ),
              ),
            ),
          ),
          // SvgPicture.asset(
          //   "assets/group_background.svg",
          //   width: MediaQuery.of(context).size.width,
          // ),
        ],
      ),
    );
  }
}



final filterTextProvider = StateProvider<String>((ref) => '');

class SearchField extends ConsumerWidget {
  const SearchField({required this.onChanged,
    required this.courses,
    super.key,
  });

  final List<CourseElement> courses;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: onChanged,
      style:
          GoogleFonts.poppins(color: Colors.white, fontSize: 13, height: 1.3),
      cursorColor: Colors.white,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: "Search ...",
          hintStyle:
              GoogleFonts.poppins(color: Colors.white70, fontSize: 12.06)),
    );
  }
}
