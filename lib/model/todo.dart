import 'package:moor_flutter/moor_flutter.dart'; 

class Exercise extends Table{
  IntColumn get id => integer().autoIncrement()(); 
  DateTimeColumn get date => dateTime()(); 
  TextColumn get task => text()(); 
  TextColumn get weight => text()(); 
  TextColumn get reps => text()(); 
  BoolColumn get isFinish => boolean()(); 
  IntColumn get TodoType => integer()(); 
}

enum TodoType {
  TYPE_TASK, TYPE_EVENT
}