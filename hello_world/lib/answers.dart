import "package:flutter/material.dart";
import "./alternative.dart";

class Answers extends StatelessWidget{
	final List<Alternative> questionList;
  final Function handler;
	Answers(this.questionList,this.handler);
	

	@override
	Widget build(BuildContext ctx){
		List<Widget> children=[];
		questionList.forEach((question){
			children.add(
				ButtonTheme(
					child:RaisedButton(
						child:Text(question.data),
						onPressed:(){
              handler(question.isCorrect);
            }
					),
					minWidth: 300,
					textTheme: ButtonTextTheme.accent,
					colorScheme: Theme.of(ctx).colorScheme.copyWith(
						primary:Colors.white54,
						secondary:Colors.black
					),
				)
			);
		});
		return Container(child:
			Column(
				children:children,
				mainAxisAlignment: MainAxisAlignment.end,
				crossAxisAlignment: CrossAxisAlignment.center,
			),
			width: double.infinity,
			margin: EdgeInsets.only(bottom:30),
		);
	}
}