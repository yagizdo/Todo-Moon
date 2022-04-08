import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class ChangeNameText extends StatelessWidget {
  const ChangeNameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Text(
                LocaleKeys.changename_title.tr(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'lib/img/businessman-min.png',
                width: 170,
              ),
            ),
          ],
        ));
  }
}
