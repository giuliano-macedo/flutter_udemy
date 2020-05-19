import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../models/calendar_event.dart';

class NextEventsBox extends StatelessWidget {
  final List<CalendarEvent> events;
  NextEventsBox(this.events);
  Widget eventCircle(BuildContext context, CalendarEvent event) {
    final DateTime now = DateTime.now();
    final int daysLeft = event.date.difference(now).inDays;
    final int daysPassed = event.date.difference(event.dateCreated).inDays;
    return Column(
      children: <Widget>[
        CircularPercentIndicator(
          radius: 75.0,
          lineWidth: 5.0,
          percent: 0.5, //Not sure
          center: new Text(
            event.name,
            textScaleFactor: 1.25,
          ),
          progressColor: Theme.of(context).primaryColorDark,
        ),
        Text("$daysLeft days left")
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }

  List<CalendarEvent> getImportantEvents() {
    final ans = List<CalendarEvent>.from(events);
    ans.sort((CalendarEvent a, CalendarEvent b) => a.date.compareTo(b.date));
    return ans.getRange(0, 4).toList();
  }

  @override
  Widget build(BuildContext context) {
    final importantEvents = getImportantEvents();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
          4,
          (index) =>
              Expanded(child: eventCircle(context, importantEvents[index]))),
    );
  }
}
