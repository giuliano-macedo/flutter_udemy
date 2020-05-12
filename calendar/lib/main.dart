import 'package:flutter/material.dart';
import "./widgets/next_events_box.dart";
import "./widgets/events_list.dart";
import 'models/calendar_event.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
	List<CalendarEvent> events=[
		CalendarEvent(name:"Exercise",type:CalendarType.notImportant,date: DateTime.now().add(new Duration(days:2))),
		CalendarEvent(name:"Do homework",type:CalendarType.important,date: DateTime.now().add(new Duration(days:2))),
		CalendarEvent(name:"Clean stuff",type:CalendarType.emergencial,date: DateTime.now().add(new Duration(days:2))),
		...List<CalendarEvent>.generate(12, (index){
			return CalendarEvent(name:"Event ${index+1}",type:CalendarType.notImportant,date: DateTime.now().add(new Duration(days:30)));
		})
	];
	Widget get body{
		return ListView(children: <Widget>[
			NextEventsBox(),
			EventsList(events:events)
		]);
	}
	@override
	Widget build(BuildContext context) {
		return MaterialApp(home:
			Scaffold(
				appBar: new AppBar(
					title:Text("Calendar")
				),
				body: body,
			)
		);
	}
}