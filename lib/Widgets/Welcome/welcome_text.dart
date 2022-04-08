import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class welcomeText extends StatelessWidget {
  const welcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Text(
                LocaleKeys.welcomescreen_title.tr(),
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
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
              child: Text(
                LocaleKeys.welcomescreen_subtitle.tr(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}
