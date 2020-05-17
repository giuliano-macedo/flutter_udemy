import "package:intl/intl.dart";
import "package:flutter/foundation.dart";

enum CalendarType { notImportant, important, emergencial }

class CalendarEvent {
  String name;
  DateTime date;
  CalendarType type;
  CalendarEvent(
      {@required this.name, @required this.date, @required this.type});

  get dateStr {
    return DateFormat.yMd().format(date);
  }
}
