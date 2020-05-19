import 'package:calendar/widgets/calendar_type_data.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "../models/calendar_event.dart";

class EventForm extends StatefulWidget {
  final Function onAdd;
  @override
  EventForm({this.onAdd});
  _EventFormState createState() => _EventFormState(onAdd);
}

class _EventFormState extends State<EventForm> {
  Function onAdd;
  final _nameController = TextEditingController();
  String _typeSelected;
  DateTime _dateSelected;
  bool _isDateSelected = false;

  _EventFormState(this.onAdd);

  void submit() {
    if (!_isDateSelected ||
        _nameController.text.isEmpty ||
        _typeSelected.isEmpty) return;

    onAdd(CalendarEvent(
        date: _dateSelected,
        name: _nameController.text,
        type: CalendarType.values[int.parse(_typeSelected)]));

    Navigator.of(context).pop();
  }

  void datePicker(BuildContext context) {
    DateTime now = DateTime.now();
    showDatePicker(
            context: context,
            initialDate: now,
            firstDate: now,
            lastDate: now.add(Duration(days: 366 * 2)))
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _dateSelected = pickedDate;
        _isDateSelected = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget nameField = TextFormField(
      decoration: InputDecoration(
        icon: Icon(Icons.outlined_flag),
        hintText: "Enter the event name",
        labelText: "Name",
      ),
      controller: _nameController,
      onFieldSubmitted: (_) {},
    );
    Widget typeField = FormField(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration:
              InputDecoration(icon: Icon(Icons.palette), labelText: "Type"),
          isEmpty: _typeSelected == "",
          child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
            value: _typeSelected,
            hint: Text("Select the Event Type"),
            icon: Icon(Icons.arrow_downward),
            onChanged: (String newValue) =>
                setState(() => _typeSelected = newValue),
            items: CalendarType.values
                .map<DropdownMenuItem<String>>((CalendarType type) {
              CalendarTypeData data = new CalendarTypeData(context, type);
              return DropdownMenuItem<String>(
                  value: type.index.toString(), child: Text(data.text));
            }).toList(),
          )),
        );
      },
    );
    Widget dateField = FormField(builder: (FormFieldState<DateTime> state) {
      return InputDecorator(
        decoration: InputDecoration(
          icon: Icon(Icons.calendar_today),
        ),
        child: GestureDetector(
          child: FlatButton(
            padding: EdgeInsets.zero,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _isDateSelected
                      ? DateFormat.yMd().format(_dateSelected).toString()
                      : "Select event Date",
                  style: _isDateSelected
                      ? Theme.of(context).textTheme.bodyText1
                      : Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 15),
                )),
            onPressed: () => datePicker(context),
          ),
          onTap: () => datePicker(context),
        ),
      );
    });
    Widget submitField =
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      RaisedButton.icon(
          color: Theme.of(context).primaryColor,
          textColor: Theme.of(context).primaryColorLight,
          icon: Icon(Icons.check),
          label: Text("Add Event"),
          onPressed: submit)
    ]);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[nameField, typeField, dateField, submitField],
        ));
  }
}
