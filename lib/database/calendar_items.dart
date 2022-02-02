import 'dart:convert';

class CalendarItem {
  String? content;
  DateTime date = DateTime.now();

  CalendarItem({
    required this.content,
    required this.date,
  });

  CalendarItem.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    date = DateTime.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'date' : date,
    };
  }

  static Map<String, dynamic> toMap(CalendarItem calendarItem) => {
    'content': calendarItem.content,
    'date': calendarItem.date.toString(),
  };

  static String encode(List<CalendarItem> calendarItems) => jsonEncode(
    calendarItems
        .map<Map<String, dynamic>>((calendarItem) => CalendarItem.toMap(calendarItem))
        .toList(),
  );

  static List<CalendarItem> decode(String calendarItem) =>
      (json.decode(calendarItem) as List<dynamic>)
          .map<CalendarItem>((item) => CalendarItem.fromJson(item))
          .toList();

  @override
  toString() {
    return '{date: $date, content: $content}';
  }
}
