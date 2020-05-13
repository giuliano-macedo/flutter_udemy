import 'package:calendar/models/calendar_event.dart';
import 'package:flutter/material.dart';

class EventsList extends StatelessWidget {
	
	final List<CalendarEvent> events;
	EventsList({@required this.events});

	@override
	Widget build(BuildContext context) {
		Function getEventCard=(CalendarEvent event){
			IconData icon;
			Color color;
			switch (event.type) {
				case CalendarType.notImportant:
					icon=Icons.hourglass_full;
					color=Theme.of(context).colorScheme.primary;
					break;
				case CalendarType.important:
					icon=Icons.error;
					color=Theme.of(context).colorScheme.secondary;
					break;
				case CalendarType.emergencial:
					icon=Icons.error;
					color=Theme.of(context).colorScheme.error;
					break;
			}
			return Container(
				child:Card(
					child: ListTile(
						leading:CircleAvatar(
							backgroundColor: color,
							radius: 30,
							child: Padding(
								padding: EdgeInsets.all(6),
								child: FittedBox(
									child: Icon(
										icon,
										size:40
									),
								),
							),
						),
						title:Text(event.name),
						subtitle:Text(event.dateStr)
					),
					elevation: 5,
				)
			);
		};
		
		return Container(
				height: 300,
				child:ListView.builder(
				itemBuilder: (ctx,index)=>getEventCard(events[index]),
				itemCount:events.length,
				scrollDirection: Axis.vertical,
				shrinkWrap: true,
			)
		);
	}
}