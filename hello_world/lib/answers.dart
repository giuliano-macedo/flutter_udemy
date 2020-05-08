import "package:flutter/material.dart";

class Answers extends StatelessWidget{
	final List<String> questionList;
  final VoidCallback onPressed;
	Answers(this.questionList,this.onPressed);
	

	@override
	Widget build(BuildContext ctx){
		List<Widget> children=[];
		questionList.forEach((question){
			children.add(
				ButtonTheme(
					child:RaisedButton(
						child:Text(question),
						onPressed:onPressed
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
		return Column(
			children:children,
			crossAxisAlignment: CrossAxisAlignment.center,
			mainAxisSize: MainAxisSize.max,
			mainAxisAlignment: MainAxisAlignment.start
    	);
	}
}