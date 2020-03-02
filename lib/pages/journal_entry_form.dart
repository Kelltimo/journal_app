import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journal_app/model/database.dart';
import 'package:journal_app/model/todo.dart';

class JournalEntryFields {
  String date;
  String task;
  String weight;
  String reps;
  String toString() {
    return 'Date: $date, Exercise: $task, Weight: $weight, Reps: $reps';
  }
}

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryFields();

  DateTime _selectedDate = DateTime.now(); 

  Future _pickDate() async {
    
    DateTime datepick = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now().add(Duration(days: -365)),
      lastDate: new DateTime.now().add(Duration(days: 365)),
    );

    if(datepick != null) setState(() {
      _selectedDate = datepick;
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _dateTimePicker(Icons.date_range, _pickDate, new DateFormat("MM-dd-yyyy").format(_selectedDate)),
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: 'Exercise', border: OutlineInputBorder()),
                      onSaved: (value) {
                        //Store value in some object
                        journalEntryFields.task = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a exercise';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: 'Weight', border: OutlineInputBorder()),
                      onSaved: (value) {
                        //Store value in some object
                        journalEntryFields.weight = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a weight';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: 'Reps', border: OutlineInputBorder()),
                      onSaved: (value) {
                        //Store value in some object
                        journalEntryFields.reps = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a rep';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      onPressed:() {
                        Navigator.of(context).pop(); 
                      },
                        child: Text('Cancel'),
                    
                    ),
                    RaisedButton(
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            Database().insertTodoEntries(new ExerciseData(
                              date: _selectedDate, 
                              task: journalEntryFields.task, 
                              weight: journalEntryFields.weight, 
                              reps: journalEntryFields.reps, 
                              TodoType: TodoType.TYPE_TASK.index,
                              isFinish: false, 
                              id: null
                            )); 
                            Navigator.of(context).pop();
                          }
                          SizedBox(
                            height: 24,
                          );
                        },
                        child: Text('Save'))
                  ]),
            )));
  }

  Widget _dateTimePicker(IconData icon, VoidCallback onPressed, String value) {
    return FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: onPressed, 
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Row(
                        children: <Widget>[
                          Icon(icon, 
                          color: Theme.of(context).accentColor, 
                          size: 30),
                          SizedBox(
                            width: 12,
                            ),
                          Text(
                            value,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  );
  }

  
}
