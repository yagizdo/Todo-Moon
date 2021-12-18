import 'package:flutter/material.dart';

// External Libs
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  Widget _circularProgressBar() {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 10.0,
      animation: true,
      percent: 80 / 100,
      center: const Text(
        '80%',
        style: TextStyle(color: Colors.white, fontSize: 10),
      ),
      backgroundColor: Colors.orangeAccent,
      progressColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left : 18.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 1.1,
            color: HexColor('#ff9d73'),
            child: SizedBox(
                height: MediaQuery.of(context).size.height / 8.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: _circularProgressBar(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Good Job John!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10.0,
                            ),
                            child: Text(
                              'Your life is well balanced',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /* Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.network("https://i.ibb.co/hX2025G/Group-3.png",
                          width: 30, height: 30),
                    )*/
                  ],
                ))),
      ),
    );
  }
}
