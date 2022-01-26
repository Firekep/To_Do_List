class CalendarItem {
  String? content;
  bool? done;

  CalendarItem({
    required this.content,
    this.done = false,
  });

  CalendarItem.fromJson(Map<String, dynamic> json) {
    content = json['content'] as String;
    done = json['done'] as bool;
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'done': done,
    };
  }
}
