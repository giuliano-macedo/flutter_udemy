import "package:flutter/material.dart";

void main(){
	runApp(App());
}

class App extends StatelessWidget {
	@override
	Widget build(BuildContext ctx){
		return MaterialApp(
			home:Scaffold(
				appBar:AppBar(
					title:Text("Hello world Quiz App")
				),
				body:Column(children:
					<Widget>[
						Text("question 1"),
						RaisedButton(child:Text("Answer 1")),
						RaisedButton(child:Text("Answer 2"))
						
					]
				)
			)
		);
	}
}