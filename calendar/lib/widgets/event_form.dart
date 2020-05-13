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
	String typeSelected;
	// DateTime _dateSelected;

	_EventFormState(this.onAdd);

	void submitData(){
		print(_nameController.text);
	}

	@override
	Widget build(BuildContext context) {
		final nameFocus=new FocusNode();
		final dropdownFocus=new FocusNode();
		return  Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical:10),child:
			Column(children: <Widget>[
				TextField(
					decoration: InputDecoration(labelText: 'Name'),
					controller:_nameController,
					textInputAction: TextInputAction.next,
					focusNode: nameFocus,
					onSubmitted: (_){
						nameFocus.unfocus();
						FocusScope.of(context).requestFocus(dropdownFocus);
					}
				),
				DropdownButton<String>(
					value: typeSelected,
					focusNode:dropdownFocus,
					icon: Icon(Icons.arrow_downward),
					iconSize: 24,
					elevation: 16,
					underline: Container(
						height: 2,
					),
					onChanged: (String newValue) {
						setState(() {
							typeSelected = newValue;
						});
					},
					items: CalendarType.values
						.map<DropdownMenuItem<String>>((CalendarType value) {
							return DropdownMenuItem<String>(
								value: value.index.toString(),
								child: Text({
											CalendarType.notImportant:"Not important",
											CalendarType.important:"Important",
											CalendarType.emergencial:"Emergencial"
										}
										[value]
										)
							);
						})
						.toList(),
					)
				],
				crossAxisAlignment: CrossAxisAlignment.start,
			)
		);
	}
}