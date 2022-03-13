class Todo {
  String title;
  String description;
  bool complete = false;
  String category;
  final now = DateTime.now().day.toString();
  String dateTime;

  Todo(
      {required this.title,
      this.description = '',
      this.complete = false,
      this.category = 'Uncategorized',
      required this.dateTime});

  //toObject
  Todo.fromMap(Map map)
      : title = map['title'] as String,
        description = map['description'] as String,
        complete = map['complete'] as bool,
        category = map['category'] as String,
        dateTime = map['datetime'] as String;

  //toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['complete'] = complete;
    data['category'] = category;
    data['datetime'] = dateTime;
    return data;
  }

  void toggleCompleted() {
    complete = !complete;
  }
}
