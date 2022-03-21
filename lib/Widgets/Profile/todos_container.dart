import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class TodosContainer extends StatelessWidget {
  TodosContainer(
      {Key? key,
      required this.containerHeight,
      required this.containerWidth,
      required this.numberfontSize,
      required this.textfontSize,
      required this.backgroundColor,
      required this.text})
      : super(key: key);
  double containerHeight;
  double containerWidth;
  double numberfontSize;
  double textfontSize;
  String backgroundColor;
  String text;

  @override
  Widget build(BuildContext context) {
    return text.contains('All Todos')
        ? Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              color: HexColor(backgroundColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(14.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: textfontSize,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10.h),
                Text(
                  '12',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: numberfontSize,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        : Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              color: HexColor(backgroundColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(14.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '12',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: numberfontSize,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.h),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: textfontSize,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
  }
}
