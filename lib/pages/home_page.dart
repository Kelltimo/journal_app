import 'package:flutter/material.dart'; 

class JournalsList extends StatefulWidget {
  static String tag = 'journalList'; 

  @override 
  State<StatefulWidget> createState() {
    return _JournalsListState(); 
  }
}

class _JournalsListState extends State<JournalsList> {
  int journalCount = 0; 
  final List<Map<String, dynamic>> dummyJournals = [
    {'title': 'Dumbbell Flys', 'reps': '10', 'weight': '45', 'date': 'Feb-14-20', 'id': 1}, 
    {'title': 'Bench Press', 'reps': '5', 'weight': '160', 'date': 'Feb-20-20', 'id': 2},
    {'title': 'Chest Flys', 'reps': '8', 'weight': '140', 'date': 'Feb-28-20', 'id': 3}, 
  ]; 

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Lifts"), 
          backgroundColor: Theme.of(context).primaryColor,
        ), 
        body: ListView.builder(
          itemBuilder: (BuildContext context, int journalPosition) {
            return Dismissible(
              key: Key(dummyJournals[journalPosition]['title']),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection swipedDir) {
                setState(() {
                  dummyJournals.remove(dummyJournals[journalPosition]); 
                }); 
              }, 
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(dummyJournals[journalPosition]['head'][0], style: TextStyle(color: Colors.blueGrey, fontSize: 100.0),), 
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(dummyJournals[journalPosition]['head'], style: TextStyle(fontFamily: 'Oswald', fontSize: 100.0),),
                    subtitle: Text(dummyJournals[journalPosition]['date']),
                  ),
                  Divider() 
                ],
              ),
            ); 
          },
          itemCount: dummyJournals.length,
        ), 
        floatingActionButton: FloatingActionButton(
          elevation: 6.0,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
              return Text('Test'); 
            })).then((_) {

            });
          },
          child: Icon(Icons.edit),
          backgroundColor: Theme.of(context).primaryColor,
        ),
    ); 
  }
}


