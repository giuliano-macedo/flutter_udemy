import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../models/calendar_event.dart';

class NextEventsBox extends StatelessWidget {
  final List<CalendarEvent> events;
  NextEventsBox(this.events);
  Widget eventCircle(BuildContext context, CalendarEvent event) {
    final DateTime now = DateTime.now();
    final int daysLeft = event.date.difference(now).inDays;
    final double percent = .5; //TODO
    return Column(
      children: <Widget>[
        CircularPercentIndicator(
          radius: 75.0,
          lineWidth: 5.0,
          percent: percent, //Not sure
          center: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              event.name,
              textScaleFactor: 0.9,
            ),
          ),
          progressColor: Theme.of(context).primaryColorDark,
        ),
        Text("$daysLeft ${daysLeft == 1 ? 'day' : 'days'} left")
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }

  List<CalendarEvent> getImportantEvents() {
    final ans = List<CalendarEvent>.from(events);
    ans.sort((CalendarEvent a, CalendarEvent b) => a.date.compareTo(b.date));
    return ans.getRange(0, min(4, events.length)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final importantEvents = getImportantEvents();
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
            importantEvents.length,
            (index) =>
                Expanded(child: eventCircle(context, importantEvents[index]))),
      ),
    );
  }
}
