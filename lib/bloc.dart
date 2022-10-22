import 'dart:async';
import 'student.dart';
import 'package:flutter/material.dart';

class StudentBloc {
  final List<Student> _studntList=[
    Student(1, 'sara', 20),
    Student(2, 'hanan', 100),
    Student(3, 'khadija', 200),
    Student(4, 'safa', 100),
    Student(5, 'madjda', 50),
  ];

  //1-stream controllers

final _studentListStreamController=StreamController<List<Student>>();
final _studentScoreIncrementStreamController=StreamController<Student>();
final _studentScoreDecrementStreamController=StreamController<Student>();

//2- Stream sink out sink in
Stream<List<Student>>get studentLisStream=>_studentListStreamController.stream;
StreamSink<List<Student>>get studentListSink=>_studentListStreamController.sink;

StreamSink<Student>get studentScoreIncrement=>_studentScoreIncrementStreamController.sink;
StreamSink<Student> get studentScoreDecrement=>_studentScoreDecrementStreamController.sink;


//3- Constructor for this class to add data and listen to changes
StudentBloc(){
  _studentListStreamController.add(_studntList);
  _studentScoreIncrementStreamController.stream.listen((_incrementScore));
  _studentScoreDecrementStreamController.stream.listen((_DecrementScore));
}

//'- functions
  _incrementScore(Student student){
  double score=student.score;
  double incrementValue=.5;
  if(student.score<100){
    _studntList[student.id-1].score=score+incrementValue;
  }
  
  }
 _DecrementScore(Student student){
  double score=student.score;
  double incrementValue=.5;
  if(student.score<100){
    _studntList[student.id-1].score=score-incrementValue;
  }
  }


}