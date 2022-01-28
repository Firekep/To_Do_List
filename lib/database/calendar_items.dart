class CalendarItem {
  String? content;
  String? date;

  CalendarItem({
    required this.content,
    required this.date,
  });

  CalendarItem.fromJson(Map<String, dynamic> json) {
    content = json['content'] as String;
    date = json['data'];
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'data' : date,
    };
  }
}
