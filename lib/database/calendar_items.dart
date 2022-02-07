import 'dart:convert';

import 'package:flutter/material.dart';

class CalendarItem {
  String? content;
  int? iconCodePoint;
  DateTime date = DateTime.now();

  CalendarItem({required this.content, required this.date, required this.iconCodePoint});

  CalendarItem.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    date = DateTime.parse(json['date']);
    iconCodePoint = json['iconCodePoint'];
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'date': date,
      'iconCodePoint': iconCodePoint,
    };
  }

  static Map<String, dynamic> toMap(CalendarItem calendarItem) => {
        'content': calendarItem.content,
        'date': calendarItem.date.toString(),
        'iconCodePoint': calendarItem.iconCodePoint, // toString
      };

  static String encode(List<CalendarItem> calendarItems) => jsonEncode(
        calendarItems
            .map<Map<String, dynamic>>(
                (calendarItem) => CalendarItem.toMap(calendarItem))
            .toList(),
      );

  static List<CalendarItem> decode(String calendarItem) =>
      (json.decode(calendarItem) as List<dynamic>)
          .map<CalendarItem>((item) => CalendarItem.fromJson(item))
          .toList();

  @override
  toString() {
    return '{date: $date, content: $content, icon: $iconCodePoint}';
  }
}
