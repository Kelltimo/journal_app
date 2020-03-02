import 'package:flutter/material.dart';
import 'package:journal_app/pages/entry_form.dart';
import 'appstatenotifier.dart';
import 'pages/description.dart';
import 'pages/journal_entry_form.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static final routes = {
    '/': (context) => MyHomePage(),
    'journal': (context) => JournalEntryForm(),
    // 'description': (context) => DetailScreen(),
  };

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          theme: notifier.darkTheme ? dark : light,
          title: 'Work Out Log',
          routes: MyApp.routes,
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: buildDrawer(context),
      appBar: AppBar(
        title: Text('Workout App'),
      ),
      body: _layoutDetails(context),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            journalForm(context);
          },
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[]),
      ),
    );
  }

  Widget buildDrawer(context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Dark Theme'),
            trailing: Consumer<ThemeNotifier>(
              builder: (context, notifier, child) => Switch(
                // title: Text("Dark mode"),
                onChanged: (val) {
                  notifier.toggleTheme();
                },
                value: notifier.darkTheme,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _mainContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Exercises',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
        ),
        Expanded(child: TaskPage())
      ],
    );
  }

  void journalForm(BuildContext context) {
    Navigator.of(context).pushNamed('journal');
  }
}

  Widget _leftDescription(context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: TaskPage(),
      )
    );
  }

  Widget _rightDescription(context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5, 
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0), 
        child: Column(
          children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Exercise: ", style: Theme.of(context).textTheme.title),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Date: ",  style: Theme.of(context).textTheme.body2),
                ],
              ),
            ), 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Weight: " + " lbs", style: Theme.of(context).textTheme.body2),
                ],
              ),
            ), 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Reps: " + " lbs", style: Theme.of(context).textTheme.body2),
                ],
              ),
            )
        ],
        )
      )
    );
  }

Widget _layoutDetails(context) {
  Orientation orientation = MediaQuery.of(context).orientation;

  if (orientation == Orientation.portrait) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Exercises',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
        ),
        Expanded(child: TaskPage())
      ],
    );
  } else {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: <Widget>[
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(20.0),
        ),
        Container(
          child: _leftDescription(context),
        ), 
        Container(
          child: _rightDescription(context),
        )
    ]);
  


  }
}

class Exercise {
  final String date; 
  final String task; 
  final String weight; 
  final String reps; 
  final bool isFinish;

  const Exercise(this.date, this.task, this.weight, this.reps, this.isFinish);  
}