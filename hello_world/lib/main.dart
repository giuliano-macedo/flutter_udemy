import "package:flutter/material.dart";

void main(){
	runApp(App());
}


class App extends StatefulWidget {
	@override
	State<StatefulWidget> createState(){
		return AppState();
	}
}
class AppState extends State<App>{
	List<String> questions=[
		"What is the tallest man made building?",
		"What is the capital of Brazil?",
		"Which is heavier, a Kg of steel or a Kg of feathers?"
	];
	int questionIndex=0;

	void answerCallback(){
		setState((){
			if(questionIndex+1<questions.length){
				questionIndex++;
			}
		});
		print(questionIndex);
	}
	@override
	Widget build(BuildContext ctx){
		return MaterialApp(
			home:Scaffold(
				appBar:AppBar(
					title:Text("Hello world Quiz App")
				),
				body:Column(children:
					<Widget>[
						Text(questions[questionIndex]),
						RaisedButton(
							child:Text("Answer 1"),
							onPressed:answerCallback
						),
						RaisedButton(
							child:Text("Answer 2"),
							onPressed:answerCallback
						)
						
					]
				)
			)
		);
	}
}