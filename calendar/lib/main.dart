import 'dart:math';

import 'package:flutter/material.dart';
import "./widgets/next_events_box.dart";
import "./widgets/events_list.dart";
import "./widgets/event_form.dart";
import 'models/calendar_event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Random rng = Random();

class _HomePageState extends State<HomePage> {
  List<CalendarEvent> events = [
    CalendarEvent(
        name: "Exercise",
        type: CalendarType.notImportant,
        date: DateTime.now().add(Duration(days: 1 + rng.nextInt(29)))),
    CalendarEvent(
        name: "Do homework",
        type: CalendarType.important,
        date: DateTime.now().add(Duration(days: 1 + rng.nextInt(29)))),
    CalendarEvent(
        name: "Clean stuff",
        type: CalendarType.emergencial,
        date: DateTime.now().add(Duration(days: 1 + rng.nextInt(29)))),
    ...List<CalendarEvent>.generate(12, (index) {
      return CalendarEvent(
          name: "Event ${index + 1}",
          type: CalendarType.notImportant,
          date: DateTime.now().add(Duration(days: 1 + rng.nextInt(29))));
    })
  ];
  BuildContext _ctx;

  void startBottomModal() {
    showModalBottomSheet(
        context: _ctx,
        builder: (_) {
          return GestureDetector(
            child: EventForm(
                onAdd: (CalendarEvent event) =>
                    setState(() => events.add(event))),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return Scaffold(
        appBar: AppBar(title: Text("Calendar")),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: startBottomModal),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Next Events'),
                background: NextEventsBox(events),
              ),
            ),
            EventsList(events),
          ],
        ));
  }
}
