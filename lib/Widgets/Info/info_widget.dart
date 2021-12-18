import 'package:flutter/material.dart';

// External Libs
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_app/Widgets/Info/info_image.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  Widget _circularProgressBar() {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 8.0,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 36, bottom: 12),
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: HexColor('#ff9d73'),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 14, left:24),
                child: Row(
                  children: [
                    Column(children: [
                      _circularProgressBar(),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Good Job John!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              'Your life is well-balanced',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            ),
            const InfoImage()
          ],
        ),
      ],
    );
  }
}
