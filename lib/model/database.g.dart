// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ExerciseData extends DataClass implements Insertable<ExerciseData> {
  final int id;
  final DateTime date;
  final String task;
  final String weight;
  final String reps;
  final bool isFinish;
  final int TodoType;
  ExerciseData(
      {@required this.id,
      @required this.date,
      @required this.task,
      @required this.weight,
      @required this.reps,
      @required this.isFinish,
      @required this.TodoType, int todoType});
  factory ExerciseData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return ExerciseData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      task: stringType.mapFromDatabaseResponse(data['${effectivePrefix}task']),
      weight:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}weight']),
      reps: stringType.mapFromDatabaseResponse(data['${effectivePrefix}reps']),
      isFinish:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_finish']),
      TodoType:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}todo_type']),
    );
  }
  factory ExerciseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExerciseData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      task: serializer.fromJson<String>(json['task']),
      weight: serializer.fromJson<String>(json['weight']),
      reps: serializer.fromJson<String>(json['reps']),
      isFinish: serializer.fromJson<bool>(json['isFinish']),
      TodoType: serializer.fromJson<int>(json['TodoType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'task': serializer.toJson<String>(task),
      'weight': serializer.toJson<String>(weight),
      'reps': serializer.toJson<String>(reps),
      'isFinish': serializer.toJson<bool>(isFinish),
      'TodoType': serializer.toJson<int>(TodoType),
    };
  }

  @override
  ExerciseCompanion createCompanion(bool nullToAbsent) {
    return ExerciseCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      task: task == null && nullToAbsent ? const Value.absent() : Value(task),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      reps: reps == null && nullToAbsent ? const Value.absent() : Value(reps),
      isFinish: isFinish == null && nullToAbsent
          ? const Value.absent()
          : Value(isFinish),
      TodoType: TodoType == null && nullToAbsent
          ? const Value.absent()
          : Value(TodoType),
    );
  }

  ExerciseData copyWith(
          {int id,
          DateTime date,
          String task,
          String weight,
          String reps,
          bool isFinish,
          int TodoType}) =>
      ExerciseData(
        id: id ?? this.id,
        date: date ?? this.date,
        task: task ?? this.task,
        weight: weight ?? this.weight,
        reps: reps ?? this.reps,
        isFinish: isFinish ?? this.isFinish,
        TodoType: TodoType ?? this.TodoType,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('task: $task, ')
          ..write('weight: $weight, ')
          ..write('reps: $reps, ')
          ..write('isFinish: $isFinish, ')
          ..write('TodoType: $TodoType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          date.hashCode,
          $mrjc(
              task.hashCode,
              $mrjc(
                  weight.hashCode,
                  $mrjc(reps.hashCode,
                      $mrjc(isFinish.hashCode, TodoType.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ExerciseData &&
          other.id == this.id &&
          other.date == this.date &&
          other.task == this.task &&
          other.weight == this.weight &&
          other.reps == this.reps &&
          other.isFinish == this.isFinish &&
          other.TodoType == this.TodoType);
}

class ExerciseCompanion extends UpdateCompanion<ExerciseData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> task;
  final Value<String> weight;
  final Value<String> reps;
  final Value<bool> isFinish;
  final Value<int> TodoType;
  const ExerciseCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.task = const Value.absent(),
    this.weight = const Value.absent(),
    this.reps = const Value.absent(),
    this.isFinish = const Value.absent(),
    this.TodoType = const Value.absent(),
  });
  ExerciseCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date,
    @required String task,
    @required String weight,
    @required String reps,
    @required bool isFinish,
    @required int TodoType,
  })  : date = Value(date),
        task = Value(task),
        weight = Value(weight),
        reps = Value(reps),
        isFinish = Value(isFinish),
        TodoType = Value(TodoType);
  ExerciseCompanion copyWith(
      {Value<int> id,
      Value<DateTime> date,
      Value<String> task,
      Value<String> weight,
      Value<String> reps,
      Value<bool> isFinish,
      Value<int> TodoType}) {
    return ExerciseCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      task: task ?? this.task,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      isFinish: isFinish ?? this.isFinish,
      TodoType: TodoType ?? this.TodoType,
    );
  }
}

class $ExerciseTable extends Exercise
    with TableInfo<$ExerciseTable, ExerciseData> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExerciseTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _taskMeta = const VerificationMeta('task');
  GeneratedTextColumn _task;
  @override
  GeneratedTextColumn get task => _task ??= _constructTask();
  GeneratedTextColumn _constructTask() {
    return GeneratedTextColumn(
      'task',
      $tableName,
      false,
    );
  }

  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  GeneratedTextColumn _weight;
  @override
  GeneratedTextColumn get weight => _weight ??= _constructWeight();
  GeneratedTextColumn _constructWeight() {
    return GeneratedTextColumn(
      'weight',
      $tableName,
      false,
    );
  }

  final VerificationMeta _repsMeta = const VerificationMeta('reps');
  GeneratedTextColumn _reps;
  @override
  GeneratedTextColumn get reps => _reps ??= _constructReps();
  GeneratedTextColumn _constructReps() {
    return GeneratedTextColumn(
      'reps',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isFinishMeta = const VerificationMeta('isFinish');
  GeneratedBoolColumn _isFinish;
  @override
  GeneratedBoolColumn get isFinish => _isFinish ??= _constructIsFinish();
  GeneratedBoolColumn _constructIsFinish() {
    return GeneratedBoolColumn(
      'is_finish',
      $tableName,
      false,
    );
  }

  final VerificationMeta _TodoTypeMeta = const VerificationMeta('TodoType');
  GeneratedIntColumn _TodoType;
  @override
  GeneratedIntColumn get TodoType => _TodoType ??= _constructTodoType();
  GeneratedIntColumn _constructTodoType() {
    return GeneratedIntColumn(
      'todo_type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, date, task, weight, reps, isFinish, TodoType];
  @override
  $ExerciseTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercise';
  @override
  final String actualTableName = 'exercise';
  @override
  VerificationContext validateIntegrity(ExerciseCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.date.present) {
      context.handle(
          _dateMeta, date.isAcceptableValue(d.date.value, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (d.task.present) {
      context.handle(
          _taskMeta, task.isAcceptableValue(d.task.value, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (d.weight.present) {
      context.handle(
          _weightMeta, weight.isAcceptableValue(d.weight.value, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (d.reps.present) {
      context.handle(
          _repsMeta, reps.isAcceptableValue(d.reps.value, _repsMeta));
    } else if (isInserting) {
      context.missing(_repsMeta);
    }
    if (d.isFinish.present) {
      context.handle(_isFinishMeta,
          isFinish.isAcceptableValue(d.isFinish.value, _isFinishMeta));
    } else if (isInserting) {
      context.missing(_isFinishMeta);
    }
    if (d.TodoType.present) {
      context.handle(_TodoTypeMeta,
          TodoType.isAcceptableValue(d.TodoType.value, _TodoTypeMeta));
    } else if (isInserting) {
      context.missing(_TodoTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ExerciseData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(ExerciseCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.date.present) {
      map['date'] = Variable<DateTime, DateTimeType>(d.date.value);
    }
    if (d.task.present) {
      map['task'] = Variable<String, StringType>(d.task.value);
    }
    if (d.weight.present) {
      map['weight'] = Variable<String, StringType>(d.weight.value);
    }
    if (d.reps.present) {
      map['reps'] = Variable<String, StringType>(d.reps.value);
    }
    if (d.isFinish.present) {
      map['is_finish'] = Variable<bool, BoolType>(d.isFinish.value);
    }
    if (d.TodoType.present) {
      map['todo_type'] = Variable<int, IntType>(d.TodoType.value);
    }
    return map;
  }

  @override
  $ExerciseTable createAlias(String alias) {
    return $ExerciseTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ExerciseTable _exercise;
  $ExerciseTable get exercise => _exercise ??= $ExerciseTable(this);
  ExerciseData _rowToExerciseData(QueryRow row) {
    return ExerciseData(
      id: row.readInt('id'),
      date: row.readDateTime('date'),
      task: row.readString('task'),
      weight: row.readString('weight'),
      reps: row.readString('reps'),
      isFinish: row.readBool('is_finish'),
      TodoType: row.readInt('todo_type'),
    );
  }

  Selectable<ExerciseData> _getByTypeQuery(int var1) {
    return customSelectQuery('Select * FROM exercise WHERE todo_type = ?',
        variables: [Variable.withInt(var1)],
        readsFrom: {exercise}).map(_rowToExerciseData);
  }

  Future<List<ExerciseData>> _getByType(int var1) {
    return _getByTypeQuery(var1).get();
  }

  Stream<List<ExerciseData>> _watchGetByType(int var1) {
    return _getByTypeQuery(var1).watch();
  }

  Future<int> _completeTask(int var1) {
    return customUpdate(
      'UPDATE exercise SET is_finish = 1 WHERE id = ?',
      variables: [Variable.withInt(var1)],
      updates: {exercise},
    );
  }

  Future<int> _deleteTask(int var1) {
    return customUpdate(
      'DELETE FROM exercise WHERE id = ?',
      variables: [Variable.withInt(var1)],
      updates: {exercise},
    );
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [exercise];
}
