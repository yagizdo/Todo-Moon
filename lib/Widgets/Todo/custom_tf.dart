import 'package:flutter/material.dart';

class CustomTF extends StatelessWidget {
  CustomTF(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.labelText})
      : super(key: key);

  String labelText;
  String hint;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
      child: TextFormField(
        maxLength: labelText.contains('Title')
            ? 25
            : labelText.contains('Category')
                ? 15
                : 250,
        maxLines: labelText.contains('Description') ? null : 1,
        controller: controller,
        validator: (value) {
          if (labelText.contains('Title')) {
            if (value!.isEmpty) {
              return 'Please enter $labelText';
            }
          }
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }
}
