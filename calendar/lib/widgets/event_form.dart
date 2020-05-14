import 'package:calendar/widgets/calendar_type_data.dart';
import "package:flutter/material.dart";
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
	bool _isDateSelected=false;

	_EventFormState(this.onAdd);

	void submit(){
		print(_nameController.text);
		print(int.parse(_typeSelected));
		print(_dateSelected);

		// onAdd();
	}

	@override
	Widget build(BuildContext context) {
		Widget nameField = TextFormField(
			decoration: InputDecoration(
				icon:Icon(Icons.outlined_flag),
				hintText:"Enter the event name",
				labelText: "Name",
			),
			controller: _nameController,
			onFieldSubmitted: (_){
			},
		);
		Widget typeField = FormField(
			builder: (FormFieldState<String> state){
				return InputDecorator(
					decoration: InputDecoration(
						icon:Icon(Icons.palette),
						labelText: "Type"
					),
					isEmpty: _typeSelected=="",
					child: DropdownButtonHideUnderline(
						child:DropdownButton<String>(
							value: _typeSelected,
							hint: Text( "Select the Event Type" ),
							icon: Icon(Icons.arrow_downward),
							onChanged: (String newValue) => setState(()=>_typeSelected = newValue),
							items: CalendarType.values
								.map<DropdownMenuItem<String>>((CalendarType type) {
									CalendarTypeData data=new CalendarTypeData(context, type);
									return DropdownMenuItem<String>(
										value: type.index.toString(),
										child: Text(data.text)
									);
								}).toList(),
						)
					),
				);
			},
		);
		Widget dateField=FormField(
			builder: (FormFieldState<String> state){
			return InputDecorator(
				decoration: InputDecoration(
					icon:Icon(Icons.calendar_today),
					labelText:"Date",
				),
				isEmpty: _isDateSelected,
				child:FlatButton(
						padding: EdgeInsets.zero,
						child:Align(
							alignment: Alignment.centerLeft,
							child:Text(
								_isDateSelected?"TODO":"Select event Date",
								style:Theme.of(context).textTheme.subtitle1
							),
						),

						onPressed: (){

						},
					),
				// child: DropdownButtonHideUnderline(
				// 	child:DropdownButton<String>(
				// 		value: _typeSelected,
				// 		hint: Text("Select the Event Type"),
				// 		onChanged: (String newValue) => setState(()=>_typeSelected = newValue),
				// 		items: null,
				// 	)
				// ),
				
			);
		});
		Widget submitField=Row(
			mainAxisAlignment: MainAxisAlignment.end,
			children: <Widget>[
				RaisedButton.icon(
					color: Theme.of(context).primaryColor,
					textColor: Theme.of(context).primaryColorLight,
					icon:Icon(Icons.check),
					label:Text("Add Event"),
					onPressed:submit
				)
			]
		);
		return  Padding(
			padding:EdgeInsets.symmetric(horizontal: 10,vertical:20),
			child:Column(
					mainAxisSize: MainAxisSize.min,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						nameField,
						typeField,
						dateField,
						submitField
					],
				)
		);
	}
}