var Student = function(firstName, scores){
	this.firstName = firstName
	this.scores = scores
}

Student.prototype.averageScore = function(){
	var sum = this.scores.reduce((x,y) => x + y)
	var meanFloat = sum/this.scores.length
	return Math.floor(meanFloat)
}

Student.prototype.letterGrade = function(){
	var average = this.averageScore();
	if(average >= 90){
		return "A"
	}else if(average >= 80){
		return 'B'
	}else if(average >= 70){
		return 'C'
	}else if(average >= 60){
		return 'D'
	}else{
		return 'F'
	}
}

