import "package:flutter/material.dart";

class Answers extends StatelessWidget{
	List<Widget> children;
	Answers(List<String> questionList,VoidCallback onPressed){
		this.children=[];
		questionList.forEach((question){
			this.children.add(
				RaisedButton(
					child:Text(question),
					onPressed:onPressed
				)
			);
		});
	}

	@override
	Widget build(BuildContext ctx){
		
		return Column(children:children);
	}
}