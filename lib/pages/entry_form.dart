import 'package:flutter/material.dart';
import 'package:journal_app/model/database.dart';
import 'package:journal_app/model/todo.dart';
import 'package:journal_app/widgets/custom_widget.dart';
import 'description.dart'; 
import 'package:intl/intl.dart'; 


class TaskPage extends StatefulWidget {

    static final routes = {
    }; 

  @override
  _TaskPageState createState() => _TaskPageState();
}

class Exercise {
  final String date; 
  final String task; 
  final String weight; 
  final String reps; 
  final bool isFinish;

  const Exercise(this.date, this.task, this.weight, this.reps, this.isFinish);  
}


final List<Exercise> _taskList = [
  new Exercise('2/21/20', 'Dumbbell Flyes', '50', '10', false), 
  new Exercise('2/21/20','Bench Press', '160', '4', false),
  new Exercise('2/21/20', 'Shoulder Press', '100', '8', false)
]; 

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 20; 

    return StreamBuilder(
      stream: Database().getTodoByType(TodoType.TYPE_TASK.index),
      builder: (context, snapshot) {
        return snapshot.data == null ? Center(child: CircularProgressIndicator()) : ListView.builder(
          padding: const EdgeInsets.all(0),
         
           itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
                children: <Widget>[
                  _lineStyle(context, iconSize, index, snapshot.data.length, snapshot.data[index].isFinish), 
                  _displayContent(snapshot.data[index])
                ],
              ),
            );
          }

          
        );
      }
    ); 
  }


Widget _displayContent(ExerciseData task) {
  var formatter = new DateFormat('yyyy-MM-dd'); 
  String formatted = formatter.format(task.date); 

      return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), 
        child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(formatted, task.task, task.weight, task.reps, task.isFinish)
                  ),
                );
              },
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(task.task),
                  Text(formatted),
                  //Text(task.weight),
                  //Text(task.reps),
                ],
              ),
              
            ),
        ),
      ),
    );
}


  Widget _lineStyle(BuildContext context, double iconSize, int index, int listLength, bool isFinish) {
    return Container(
      decoration: CustomIconDecoration(
        iconSize: iconSize, 
        lineWidth: 1, 
        firstData: index == 0 ?? true, 
        lastData: index == listLength - 1 ?? true), 
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        )
      )
    );
  }

  void Description(BuildContext context) {
    Navigator.of(context).pushNamed('description');
  }
}

