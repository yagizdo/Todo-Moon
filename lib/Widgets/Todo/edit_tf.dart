import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../translations/locale_keys.g.dart';

class EditTF extends StatelessWidget {
  EditTF(
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
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
      child: TextFormField(
        textInputAction: labelText.contains(LocaleKeys.edittodo_desc_tf.tr()) ||
                labelText.contains(LocaleKeys.edittodo_title_tf.tr())
            ? TextInputAction.next
            : TextInputAction.done,
        maxLength: labelText.contains(LocaleKeys.addtodo_title_tf.tr())
            ? 15
            : labelText.contains(LocaleKeys.edittodo_category_tf.tr())
                ? 15
                : 250,
        maxLines:
            labelText.contains(LocaleKeys.edittodo_desc_tf.tr()) ? null : 1,
        controller: controller,
        validator: (value) {
          if (labelText.contains(LocaleKeys.edittodo_title_tf.tr())) {
            if (value!.isEmpty
                // || RegExp(r"\s").hasMatch(value.toString())
                ) {
              return LocaleKeys.addtodo_error_text.tr(args: [labelText]);
            }
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
            hintStyle: const TextStyle(color: Colors.black)),
      ),
    );
  }
}
