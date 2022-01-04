import 'package:flutter/material.dart';

// External Libs
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Widgets/Info/info_image.dart';
import 'package:todo_app/provider/todos_provider.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  Widget _circularProgressBar(double percent) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 8.0,
      animation: true,
      percent: percent,
      center: Text(
        '${(percent * 100).round()}%',
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
      backgroundColor: Colors.orangeAccent,
      progressColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    double percent = Provider.of<TodosProvider>(context).calcTodoPercent();
    print(percent);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                  color: HexColor('#ff9d73'),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 14, left: 24),
                child: Row(
                  children: [
                    Column(children: [
                      _circularProgressBar(percent),
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
