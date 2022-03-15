import 'package:flutter/material.dart';

class welcomeText extends StatelessWidget {
  const welcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: Text(
                'Welcome',
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
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15, right: 15),
              child: Text(
                'Please provide your name and surname to address you',
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
