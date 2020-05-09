import "package:flutter/material.dart";
import "./answers.dart";
import "./alternative.dart";

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
	int _score=0;
  final List<String> _questions=const[
		"What is the tallest man made building?",
		"What is the capital of Brazil?",
		"Which is heavier, a Kg of"
	];
	final List<List<Alternative>> _answers=[
		[
			Alternative.incorrect("Empire State Building (USA)"),
			Alternative.  correct("Burj Khalifa (Dubai)"),
			Alternative.incorrect("Shanghai Tower (China)"),
			Alternative.incorrect("Makkah Clock Tower (Saudi Arabia)"),
		],
		[
			Alternative.incorrect("São Paulo"),
			Alternative.incorrect("Peru"),
			Alternative.  correct("Brasilia"),
			Alternative.incorrect("Rio de Janeiro"),
		],
		[
			Alternative. correct("Steel?"),
			Alternative. correct("Feathers?"),
			Alternative. correct("Water?"),
			Alternative. correct("Lead?"),
			Alternative. correct("Titanium?"),
		]
	];
	int _questionIndex=0;
	bool _finished=false;

	void answerCallback(bool isCorrect){
		setState((){
			if(_questionIndex+1<_questions.length)
				_questionIndex++;
			else
				_finished=true;
      _score+=isCorrect?1:0;
		}); 
	}
	void reset(){
		setState(() {
			_finished=false;
			_questionIndex=0;
			_score=0;
		});
	}
  Widget get body{
    if(!_finished){
			return Stack(children:
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
							margin:EdgeInsets.only(top:100)
						),
						Answers(_answers[_questionIndex],answerCallback)
					]
        );
		}
    return Container(child:
      Column(
      children:<Widget>[
        Text(
            "You finished it!\nyour score is $_score/${_questions.length}",
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            )
        ),
        ButtonTheme(
          child:
            RaisedButton(
              child:Text("Try again"),
              onPressed: reset
            )
        )
      ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      width: double.infinity,
      );

    }
	@override
	Widget build(BuildContext ctx){
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