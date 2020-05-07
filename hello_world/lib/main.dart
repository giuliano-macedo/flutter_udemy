import "package:flutter/material.dart";
import "./answers.dart";

void main(){
	runApp(App());
}

class App extends StatefulWidget {
	@override
	State<StatefulWidget> createState(){
		return _AppState();
	}
}
class _AppState extends State<App>{
	List<String> _questions=[
		"What is the tallest man made building?",
		"What is the capital of Brazil?",
		"Which is heavier, a Kg of"
	];
	List<List<String>> _answers=[
		[
			"Empire State Building (USA)",
			"Burj Khalifa (Dubai)",
			"Shanghai Tower (China)",
			"Makkah Clock Tower (Saudi Arabia)"
		],
		[
			"São Paulo",
			"Peru",
			"Brasilia",
			"Rio de Janeiro"
		],
		[
			"Steel",
			"Feathers",
			"Water",
			"Lead",
			"Titanium"
		]
	];
	int _questionIndex=0;

	void answerCallback(){
		setState((){
			if(_questionIndex+1<_questions.length){
				_questionIndex++;
			}
		});
		print(_questionIndex);
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
						Text(_questions[_questionIndex]),
						Answers(_answers[_questionIndex],answerCallback)
					]
				)
			)
		);
	}
}