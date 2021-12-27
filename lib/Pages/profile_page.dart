import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAB(),
      body: Center(
        child: Container(
          color: HexColor('#f3f0e5'),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://yagizdokumaci.com/img/yagophoto.jpg'),
                    radius: 60,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top : 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Yılmaz Yağız Dokumacı',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top : 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    width: MediaQuery.of(context).size.width /1.05,
                    height: MediaQuery.of(context).size.height/9,
                    decoration: BoxDecoration(
                        color: HexColor('#ff9d73'),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(top : 20.0,left: 10),
                      child: Text('Completed Tasks : ',style: TextStyle(fontSize: 20,color: Colors.white),),
                    ),
                  )
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}

AppBar homePageAB() {
  return AppBar(
    leading: const Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0),
        child: Icon(Icons.settings, color: Colors.black)),
    //Icon(Icons.settings),
    backgroundColor: HexColor('#f3f0e5'),
    elevation: 0,
  );
}
