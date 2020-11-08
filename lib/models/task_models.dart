class Task {
  int id;
  String title;
  DateTime date;
  String priority;
  int status; // 0 - incomplete, 1 - complete

  Task({this.priority, this.title, this.date, this.status});
  Task.withId({this.id, this.priority, this.title, this.date, this.status});

  //create a map to store in our database
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    //cos we cant store datetime to sql database directly we do:
    map['date'] = date.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;

    return map;
  }

  //convert back to map task objects we can manipulate in our code
  // we do this by using the factory method:
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
        id: map['id'],
        title: map['title'],
        date: DateTime.parse(map['date']),
        priority: map['priority'],
        status: map['status']);
  }
}
