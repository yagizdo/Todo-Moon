import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {Key? key,
      required this.title,
      required this.desc,
      required this.category})
      : super(key: key);
  final String title;
  final String desc;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#f9f6e8'),
        elevation: 0,
      ),
      backgroundColor: HexColor('#f9f6e8'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: categoryText(category, context),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child:
            Column(children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ]),
          ), Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                child: Image.asset('lib/img/placeholder.jpg',height: 250,),
              ),
              const Padding(
                padding: EdgeInsets.only(left : 10.0),
                child: Text(
                  'Description',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,left: 15),
                child: Text(desc.isEmpty ? 'Desc is empty' : desc),
              )
            ],
          )
        ],
      ),
    );
  }
}
Widget categoryText(String categoryName, BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 30,
    width: MediaQuery.of(context).size.width / 4,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: HexColor('#d3e3f2'),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Center(
          child: Text(
        categoryName,
        style: const TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 10),
      )),
    ),
  );
}