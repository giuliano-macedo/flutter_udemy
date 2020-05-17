import "package:flutter/material.dart";
import "../models/calendar_event.dart";

class CalendarTypeData {
  IconData iconData;
  Color color;
  String text;
  CalendarTypeData(BuildContext context, CalendarType type) {
    switch (type) {
      case CalendarType.notImportant:
        text = "Not important";
        iconData = Icons.hourglass_full;
        color = Theme.of(context).colorScheme.primary;
        break;
      case CalendarType.important:
        text = "Important";
        iconData = Icons.error;
        color = Theme.of(context).colorScheme.secondary;
        break;
      case CalendarType.emergencial:
        text = "Emergencial";
        iconData = Icons.error;
        color = Theme.of(context).colorScheme.error;
        break;
    }
  }
}
