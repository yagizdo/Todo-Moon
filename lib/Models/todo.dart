class Todo {
  String title;
  String description;
  bool complete = false;


  Todo(this.title,  this.description, this.complete);

  /*Todo.fromMap(Map map) :
        title = map['title'] as String,
        description = map['description'] as String,
        complete = map['complete'] as bool;

  Map toMap() {
    return {
      'title' : title,
      'description' : description,
      'complete' : complete,
    };
  }
}*/
}