import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

import '../../Pages/change_name_page.dart';
import "string_extension.dart";

class NameText extends StatelessWidget {
  const NameText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO circle avatar ve kalem iconunun size larini responsive ver
    return LayoutBuilder(builder: (context, constraints) {
      print('width : ${constraints.maxWidth}');
      print('height : ${constraints.maxHeight}');
      return Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<TodosProvider>(
                builder: (context, state, child) => AutoSizeText(
                  '${state.name.toTitleCase()} ${state.surname.toTitleCase()} ',
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w500),
                ),
              ),
              GestureDetector(
                onTap: () {
                  /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChangeNameScreen()));*/
                  showCupertinoModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      context: context,
                      builder: (context) => SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: const ChangeNameScreen()));
                },
                child: SvgPicture.asset(
                  'lib/img/cnameicon.svg',
                  color: Colors.black,
                  width: 18,
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
