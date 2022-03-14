import 'package:flutter/material.dart';
// External Libs
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  Widget _circularProgressBar(double percent) {
    return CircularPercentIndicator(
      radius: 48.0,
      lineWidth: 6.0,
      animation: true,
      percent: percent.isNaN ? 0 : percent,
      center: Text(
        percent.isNaN
            ? '${((percent = 0) * 100).round()}%'
            : '${(percent * 100).round()}%',
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
      backgroundColor: Colors.white,
      progressColor: Colors.orangeAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    double percent =
        Provider.of<TodosProvider>(context).calcTodoPercent(DateTime.now());
    //print(percent);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 350) {
                return Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 7.7,
                  decoration: BoxDecoration(
                      color: HexColor('#ff9d73'),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 14, bottom: 12, left: 24),
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
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 7.4,
                  decoration: BoxDecoration(
                      color: HexColor('#ff9d73'),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 14, bottom: 12, left: 24),
                    child: Row(
                      children: [
                        Column(children: [
                          _circularProgressBar(percent),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Consumer<TodosProvider>(
                                builder: (context, state, child) => Text(
                                  'Good Job ${state.name}!',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
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
                      ],
                    ),
                  ),
                );
              }
            }),
          ],
        ),
      ],
    );
  }
}
