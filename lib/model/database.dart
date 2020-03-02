import 'package:moor_flutter/moor_flutter.dart'; 
import 'package:journal_app/model/todo.dart'; 


part 'database.g.dart'; 

@UseMoor (
  tables: [Exercise], 
  queries: {
    '_getByType': 'Select * FROM exercise WHERE todo_type = ?',
    '_completeTask': 'UPDATE exercise SET is_finish = 1 WHERE id = ?',
    '_deleteTask': 'DELETE FROM exercise WHERE id = ?'
  }
)

class Database extends _$Database {
  // we tell the database where to store the data with this constructor
  Database() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'todos_file.sqlite'));

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  Stream<List<ExerciseData>> getTodoByType(int type) => _watchGetByType(type);

  Future insertTodoEntries(ExerciseData entry) {
    return into(exercise).insert(entry); 
  }

  Future completeTodoEntries(int id) {
    return _completeTask(id); 
  }

  Future deleteTodoEntries(int id) {
    return _deleteTask(id); 
  }

}