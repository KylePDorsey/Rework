var Classroom = function(students){
	this.students = students

}

Classroom.prototype.find = function(nameToFind){
	for(var i = 0; i < this.students.length; i++){
		var currentStudent = this.students[i]
		if( nameToFind === currentStudent.firstName ){
			return currentStudent
		}
	}
}

Classroom.prototype.honorRollStudents = function(){
	var honorRoll = []
	this.students.forEach(function(student){
		if(student.averageScore() >= 95){
			honorRoll.push(student); 
		}
	})
	return honorRoll
}