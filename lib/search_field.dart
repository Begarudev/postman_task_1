import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postman_task_1/riverpod.dart';

class SearchField extends ConsumerWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: ShapeDecoration(
            color: const Color.fromRGBO(65, 105, 225, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        child: TextField(
          onChanged: (value) {
            ref
                .watch(filterTextProvider.notifier)
                .update((state) => value.toLowerCase());
          },
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 13, height: 1.3),
          cursorColor: Colors.white,
          cursorOpacityAnimates: true,
          decoration: InputDecoration(
              disabledBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: "Search ...",
              hintStyle:
                  GoogleFonts.poppins(color: Colors.white70, fontSize: 12.06)),
        ),
      ),
    );
  }
}
