import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

import 'name_text.dart';

class ProfileImg extends StatefulWidget {
  ProfileImg({Key? key, required this.avatarSize}) : super(key: key);
  double avatarSize;

  @override
  State<ProfileImg> createState() => _ProfileImgState();
}

class _ProfileImgState extends State<ProfileImg> {
  @override
  void initState() {
    super.initState();
    Provider.of<TodosProvider>(context, listen: false).base64ToImage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    Provider.of<TodosProvider>(context, listen: false)
                        .pickImage(context);
                  });
                },
                child: Consumer<TodosProvider>(
                  builder: (context, state, child) => state.profileImage != null
                      ? CircleAvatar(
                          backgroundImage: MemoryImage(state.profileImage!),
                          radius: widget.avatarSize,
                        )
                      : CircleAvatar(
                          child: Text(
                            '${state.name[0].toUpperCase()}${state.surname[0].toUpperCase()}',
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                          backgroundColor: HexColor('#ff9d73'),
                          radius: widget.avatarSize,
                        ),
                ),
              ),
              const NameText(),
            ],
          ),
          Positioned(
            top: 70.h,
            left: 215.w,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Icon(
                Icons.add_circle,
                color: HexColor('#FFBA9D'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
