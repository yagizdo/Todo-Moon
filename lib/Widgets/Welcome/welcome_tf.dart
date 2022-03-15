import 'package:flutter/material.dart';

class WelcomCustomTF extends StatelessWidget {
  WelcomCustomTF({Key? key, required this.controller, required this.labelText})
      : super(key: key);

  String labelText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 20.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $labelText';
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.amber.shade50,
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.clear_outlined,
              size: 20,
              color: Colors.red,
            ),
            onPressed: () {
              controller.text = '';
            },
          ),
          hintText: labelText,
        ),
      ),
    );
  }
}
