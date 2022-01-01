class Todo {
  String title;
  String description;
  bool complete = false;
  String category;

  Todo({required this.title, this.description='', this.complete=false, this.category='Uncategorized'});

  //toObject
  Todo.fromMap(Map map):
        title = map['title'] as String,
        description = map['description'] as String,
        complete = map['complete'] as bool,
        category = map['category'] as String;

  //toJson
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['complete'] = complete;
    data['category'] = category;
    return data;
  }

  void toggleCompleted(){
    complete = !complete;
  }

}