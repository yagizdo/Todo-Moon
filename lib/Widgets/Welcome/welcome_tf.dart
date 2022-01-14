import 'package:flutter/material.dart';

class WelcomCustomTF extends StatelessWidget {
  WelcomCustomTF(
      {Key? key,
        required this.controller,
        required this.labelText})
      : super(key: key);

  String labelText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter $labelText';
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
