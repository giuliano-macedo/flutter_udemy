import 'package:flutter/material.dart';
import "./widgets/next_events_box.dart";
import "./widgets/events_list.dart";
import "./widgets/event_form.dart";
import 'models/calendar_event.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return MaterialApp(
			home:HomePage()
		);
	}
}

class HomePage extends StatefulWidget {
	@override
	_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	List<CalendarEvent> events=[
		CalendarEvent(name:"Exercise",type:CalendarType.notImportant,date: DateTime.now().add(new Duration(days:2))),
		CalendarEvent(name:"Do homework",type:CalendarType.important,date: DateTime.now().add(new Duration(days:2))),
		CalendarEvent(name:"Clean stuff",type:CalendarType.emergencial,date: DateTime.now().add(new Duration(days:2))),
		...List<CalendarEvent>.generate(12, (index){
			return CalendarEvent(name:"Event ${index+1}",type:CalendarType.notImportant,date: DateTime.now().add(new Duration(days:30)));
		})
	];
	BuildContext _ctx;
	void addEvent(String name,DateTime date,CalendarType type){
		CalendarEvent event=new CalendarEvent(name: name, date: date, type: type);
		setState(()=>events.add(event));
	}
	void startBottomModal(){
		showModalBottomSheet(
			context: _ctx,
			builder: (_){
				return GestureDetector(
					child: EventForm(onAdd:addEvent),
					onTap: (){},
					behavior: HitTestBehavior.opaque,
				);
			}
		);
	}
	@override
	Widget build(BuildContext context) {
		_ctx=context;
		return Scaffold(
			appBar: new AppBar(
				title:Text("Calendar")
			),
			floatingActionButton:FloatingActionButton(
				child:Icon(Icons.add),
				onPressed: startBottomModal
			),
			body: ListView(children: <Widget>[
				NextEventsBox(),
				EventsList(events:events)
			])
		);
	}
}