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
	final List<String> _questions=const[
		"What is the tallest man made building?",
		"What is the capital of Brazil?",
		"Which is heavier, a Kg of"
	];
	final List<List<String>> _answers=const [
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
			"Steel?",
			"Feathers?",
			"Water?",
			"Lead?",
			"Titanium?"
		]
	];
	int _questionIndex=0;
	bool _finished=false;

	void answerCallback(){
		setState((){
			if(_questionIndex+1<_questions.length)
				_questionIndex++;
			else
				_finished=true;
		});
		print(_questionIndex); 
	}
	@override
	Widget build(BuildContext ctx){
		Widget body;
		if(!_finished){
			body=Column(children:
					<Widget>[
						Container(
							child:Text(
								_questions[_questionIndex],
								style:TextStyle(
									fontSize:28
								),
								textAlign:TextAlign.center
							),
							width:double.infinity,
							margin:EdgeInsets.all(10)
						),
						Answers(_answers[_questionIndex],answerCallback)
					]
				);
		}
		else{
			body=Center(
				child: Text(
					"You finished it!",
					style:TextStyle(
						fontSize: 32
					)
				)
			);
		}
		return MaterialApp(
			home:Scaffold(
				appBar:AppBar(
					title:Text("Hello world Quiz App")
				),
				body:body
			)
		);
	}
}