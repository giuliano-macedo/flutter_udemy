import "package:flutter/material.dart";

class EventForm extends StatefulWidget {
	final Function onAdd;
	@override
	EventForm({this.onAdd});
	_EventFormState createState() => _EventFormState(onAdd);
}

class _EventFormState extends State<EventForm> {
	Function onAdd;
	final _nameController = TextEditingController();
	int typeSelected;
	// DateTime _dateSelected;

	_EventFormState(this.onAdd);

	void submitData(){
		print(_nameController.text);
	}

	@override
	Widget build(BuildContext context) {
		final nameFocus=new FocusNode();
		final dropdownFocus=new FocusNode();
		return  Column(children: <Widget>[
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
					dropdownValue = newValue;
					});
				},
				items: <String>['One', 'Two', 'Free', 'Four']
					.map<DropdownMenuItem<String>>((String value) {
						return DropdownMenuItem<String>(
						value: value,
						child: Text(value),
						);
					})
					.toList(),
				)
			
		]);
	}
}