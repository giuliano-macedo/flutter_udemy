class Alternative{
	String data;
	bool isCorrect;

	Alternative(this.data,this.isCorrect);
	Alternative.correct  (this.data){
		isCorrect=true;
	}
	Alternative.incorrect(this.data){
		isCorrect=false;
	}
}