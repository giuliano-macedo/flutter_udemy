
//Create a new Flutter App (flutter create flutter_assignment, then replace your main.dart with the attached one) and output an AppBar and some text below it (i.e. in the body of the page)
//Add a button (e.g. RaisedButton) which changes the text (to any other text of your choice)
//Split the app into three custom widgets: App, TextControl & Text

import "package:flutter/material.dart";

import "./text_control.dart";
import "./mytext.dart";

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _text="Lorem Ipsum";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			home:Scaffold(
				appBar:AppBar(
					title:Text("Assignment 1")
				),
				body:Center(child:Column(children:<Widget>[
          TextControl(_text),
          RaisedButton(
            child: MyText("capitalize text"),
            onPressed: ()=>setState(()=>_text=_text.toUpperCase()),
          ),
          RaisedButton(
            child: MyText("lower text"),
            onPressed: ()=>setState(()=>_text=_text.toLowerCase()),
          )
        ]))
			)
		);

  }
}