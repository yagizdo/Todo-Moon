import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_app/Pages/change_name_page.dart';

class ChangeNameBTN extends StatelessWidget {
  const ChangeNameBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 18,
        child: ElevatedButton(
          onPressed: () {
            /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangeNameScreen()));*/
            showMaterialModalBottomSheet(
                context: context,
                builder: (context) => SizedBox(
                    height: MediaQuery.of(context).size.height / 1.1,
                    child: const ChangeNameScreen()));
          },
          child: const Text('Change'),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(HexColor('#ff9d73')),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
