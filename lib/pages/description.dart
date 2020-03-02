import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'entry_form.dart'; 

class DetailScreen extends StatefulWidget {
  final String date; 
  final String task; 
  final String weight; 
  final String reps; 
  final bool isFinish;

  // In the constructor, require a Todo.
  DetailScreen(this.date, this.task, this.weight, this.reps, this.isFinish, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailScreenState(); 

} 

class _DetailScreenState extends State<DetailScreen> {
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.


    
    return Scaffold(
       appBar: AppBar(
        title: Text("Exercise Performed"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text("Exercise: " + widget.task, style: Theme.of(context).textTheme.display1),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text("Date: " + widget.date, style: Theme.of(context).textTheme.body2),
                ],
              ),
            ), 
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text("Weight: " + widget.weight + " lbs", style: Theme.of(context).textTheme.body2),
                ],
              ),
            ), 
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text("Reps: " + widget.reps + " lbs", style: Theme.of(context).textTheme.body2),
                ],
              ),
            )
        ],
      ),
    );
  }
}

