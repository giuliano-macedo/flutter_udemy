import 'package:calendar/models/calendar_event.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
	
	final List<CalendarEvent> events;
	EventsList({this.events});
	
	Widget getEventCard(int index){
		CalendarEvent event=events[index];
		return Card(
			child: ListTile(
				leading:Text(event.type.toString()),
				title:Text(event.name),
				subtitle:Text(event.dateStr)
			),
			elevation: 5,
		);
	}

	@override
	Widget build(BuildContext context) {
		return ListView.builder(
				itemBuilder: (ctx,index)=>getEventCard(index),
				itemCount:events.length
			);
	}
}