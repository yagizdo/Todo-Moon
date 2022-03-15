import 'package:flutter/material.dart';

class ChangeNameText extends StatelessWidget {
  const ChangeNameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Text(
                'Change Name',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                'lib/img/businessman.png',
                width: 170,
              ),
            ),
          ],
        ));
  }
}
