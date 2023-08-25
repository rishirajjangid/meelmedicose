import 'package:flutter/material.dart';
import 'package:meelmedicose/res/colors/app_color.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

List<String> list = <String>[
  'State',
  'One',
  'Two',
  'Threekjjkjkjjkjk',
  'Four',
  'Rajasthan '
];

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.keyboard_arrow_down,
        size: 40,
      ),
      elevation: 16,
      style: const TextStyle(color: AppColor.appColor),
      underline: Container(
        height: 2,
        color: AppColor.appColor,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
