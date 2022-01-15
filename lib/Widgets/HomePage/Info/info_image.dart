import 'package:flutter/material.dart';

class InfoImage extends StatelessWidget {

  const InfoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Image.asset('lib/img/star_img.png', width: 100, height: 100)
    );
  }
}
