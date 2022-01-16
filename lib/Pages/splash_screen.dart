import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Text('SPLASH SCREEN',style: TextStyle(fontSize: 30,color: Colors.black),),
    );
  }
}
