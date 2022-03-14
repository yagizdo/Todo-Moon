import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../Pages/welcome_screen.dart';

class ChangeNameBTN extends StatelessWidget {
  const ChangeNameBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: ElevatedButton(
            onPressed: () {
              showCupertinoModalBottomSheet(
                  context: context, builder: (context) => WelcomeScreen());
            },
            child: const Text('Change'),
            style: ElevatedButton.styleFrom(
              primary: HexColor('#ff9d73'),
              shape: const StadiumBorder(),
            )),
      ),
    );
  }
}
