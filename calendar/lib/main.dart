import 'package:flutter/material.dart';
import "./widgets/next_events_box.dart";
import "./widgets/events_list.dart";


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
	@override
	_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
	Widget get body{
		return ListView(children: <Widget>[
			NextEventsBox(),
			EventsList()
		]);
	}
	@override
	Widget build(BuildContext context) {
		return Scaffold(appBar: new AppBar(),body: body,);
	}
}