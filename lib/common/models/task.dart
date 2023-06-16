class Task {
  int? id;
  String? title;
  String? desc;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? remind;
  String? repeat;
  Task({
    this.id,
    this.title,
    this.desc,
    required this.isCompleted,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remind,
    required this.repeat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'desc': desc,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'remind': remind,
      'repeat': repeat,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      isCompleted:
          map['isCompleted'] != null ? map['isCompleted'] as int : null,
      date: map['date'] != null ? map['date'] as String : null,
      startTime: map['startTime'] != null ? map['startTime'] as String : null,
      endTime: map['endTime'] != null ? map['endTime'] as String : null,
      remind: map['remind'] != null ? map['remind'] as int : null,
      repeat: map['repeat'] != null ? map['repeat'] as String : null,
    );
  }
}
