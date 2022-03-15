import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_app/Widgets/Todo/todo_card.dart';
import 'package:todo_app/provider/todos_provider.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f9f6e8'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            children: [
              TableCalendar(
                rowHeight: 45,
                firstDay: DateTime.utc(2010),
                lastDay: DateTime.utc(2050),
                eventLoader:
                    Provider.of<TodosProvider>(context, listen: false).getTodos,
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                calendarFormat: CalendarFormat.month,
                calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: Colors.amber, shape: BoxShape.circle)),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                },
              ),
              Expanded(
                child:
                    Consumer<TodosProvider>(builder: (context, state, child) {
                  return ListView.builder(
                    // ignore: non_constant_identifier_names
                    itemCount: state.unCompletedTodos.where((Todo) {
                      return DateTime.fromMillisecondsSinceEpoch(
                                      Todo.dateMilliseconds)
                                  .day ==
                              _selectedDay?.day &&
                          DateTime.fromMillisecondsSinceEpoch(
                                      Todo.dateMilliseconds)
                                  .month ==
                              _selectedDay?.month;
                    }).length,
                    itemBuilder: (context, index) => TodoCard(
                        // ignore: non_constant_identifier_names
                        todo: state.unCompletedTodos.where((Todo) {
                      var todoTime = DateTime.fromMillisecondsSinceEpoch(
                          Todo.dateMilliseconds);
                      return todoTime.day == _selectedDay?.day &&
                          DateTime.fromMillisecondsSinceEpoch(
                                      Todo.dateMilliseconds)
                                  .month ==
                              _selectedDay?.month;
                    }).toList()[index]),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
AppBar homePageAB() {
  return AppBar(
    leading: const Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15.0),
        child: Icon(Icons.settings, color: Colors.black)),
    //Icon(Icons.settings),
    backgroundColor: HexColor('#f9f6e8'),
    elevation: 0,
  );
}*/
