import 'package:flutter/cupertino.dart';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;

  Event({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    required this.backgroundColor,
    required this.isAllDay,
  });
}
