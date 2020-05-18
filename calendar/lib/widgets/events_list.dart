import 'package:calendar/models/calendar_event.dart';
import 'calendar_type_data.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
  final List<CalendarEvent> events;
  EventsList(this.events);

  @override
  Widget build(BuildContext context) {
    Function getEventCard = (CalendarEvent event) {
      CalendarTypeData data = new CalendarTypeData(context, event.type);
      return Container(
          child: Card(
        child: ListTile(
            leading: CircleAvatar(
              backgroundColor: data.color,
              radius: 30,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: FittedBox(
                  child: Icon(data.iconData, size: 40),
                ),
              ),
            ),
            title: Text(event.name),
            subtitle: Text(event.dateStr)),
        elevation: 5,
      ));
    };

    return SliverFixedExtentList(
      itemExtent: 75.0,
      delegate: SliverChildBuilderDelegate(
          (ctx, index) => getEventCard(events[index]),
          childCount: events.length),
    );

    // return Container(
    //     child: ListView.builder(
    //   itemBuilder: (ctx, index) => getEventCard(events[index]),
    //   itemCount: events.length,
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    // ));
  }
}
