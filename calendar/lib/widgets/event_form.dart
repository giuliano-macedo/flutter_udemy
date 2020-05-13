import 'package:calendar/widgets/calendar_type_data.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
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

	_EventFormState(this.onAdd);

	void submit(){
		print(_nameController.text);
		print(int.parse(_typeSelected));
		print(_dateSelected);

		// onAdd();
	}

	final nameFocus=new FocusNode();
	final dropdownFocus=new FocusNode();
	@override
	Widget build(BuildContext context) {
		return  Padding(
			padding:EdgeInsets.symmetric(horizontal: 50,vertical:20),
			child:Column(children: <Widget>[
				TextField(
					decoration: InputDecoration(labelText: 'Name'),
					controller:_nameController,
					autofocus: true,
					textInputAction: TextInputAction.next,
					focusNode: nameFocus,
					onSubmitted: (_){
						nameFocus.unfocus();
						// focus on dropdownButton not working
						// dropdownFocus.requestFocus();
						FocusScope.of(context).requestFocus(dropdownFocus);
					}
				),
				SizedBox(height: 15),
				DropdownButton<String>(
					value: _typeSelected,
					hint: Text("Type"),
					focusNode:dropdownFocus,
					focusColor: Colors.blue,
					icon: Icon(Icons.arrow_downward),
					onChanged: (String newValue) => setState(()=>_typeSelected = newValue),
					items: CalendarType.values
						.map<DropdownMenuItem<String>>((CalendarType type) {
							CalendarTypeData data=new CalendarTypeData(context, type);
							return DropdownMenuItem<String>(
								value: type.index.toString(),
								child: Text(data.text)
							);
						})
						.toList(),
					),
					SizedBox(height: 5),
					RaisedButton.icon(
						icon:Icon(Icons.calendar_today),
						label: Text("Select Date"),
						onPressed: (){

						},
					),
					SizedBox(height: 5),
					RaisedButton.icon(
						icon:Icon(Icons.check),
						label:Text("Add Event"),
						onPressed:submit
					)
				],
				crossAxisAlignment: CrossAxisAlignment.start,
			)
		);
	}
}