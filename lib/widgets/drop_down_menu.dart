import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownMenu extends ConsumerStatefulWidget {
  const DropDownMenu({
    super.key,
    required this.list,
    required this.hintText,
    required this.choiceProvider,
  });

  final StateProvider<String> choiceProvider;

  final List list;
  final String hintText;

  @override
  ConsumerState<DropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends ConsumerState<DropDownMenu> {
  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: ShapeDecoration(
            color: const Color.fromRGBO(65, 105, 225, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        child: DropdownButton(
          iconSize: 20,
          isExpanded: true,
          value: dropDownValue,
          style: GoogleFonts.poppins(color: Colors.white),
          dropdownColor: const Color.fromRGBO(65, 105, 225, 1),
          borderRadius: BorderRadius.circular(18),
          hint: Text(
            overflow: TextOverflow.fade,
            softWrap: false,
            widget.hintText,
            style: GoogleFonts.lato(color: Colors.white),
          ),
          icon: const Expanded(
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
            ),
          ),
          underline: const SizedBox(),
          items: [
            ...widget.list.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            if (dropDownValue != null)
              DropdownMenuItem<String>(
                value: '',
                child: const Text(
                  "Clear Selection",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  setState(() {
                    dropDownValue = '';
                  });
                },
              ),
          ],
          onChanged: (value) {
            setState(() {
              dropDownValue = value;
              ref
                  .watch(widget.choiceProvider.notifier)
                  .update((state) => value!);
            });
          },
        ),
      ),
    );
  }
}
