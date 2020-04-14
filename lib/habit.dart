import 'package:flutter/material.dart';
import 'dart:async';
import 'package:habitly/db_connection.dart';
import 'package:sqflite/sqflite.dart';

/// Information about a [Habit].
class Habit extends StatefulWidget {

  final int id;
  final String name;

  Habit({ this.id, this.name});

  // Convert a Habit into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  _HabitState createState() => _HabitState();
}

// insert a @Habit into the database
Future<void> insertHabit(Habit habit) async {
  // Get a reference to the database.
  final Database db = await openData();

  // Insert the Habit into the correct table.
  // conflictAlgorithm in case the same habit is inserted twice, replace any previous data.
  await db.insert(
    'habits',
    habit.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves all the habits from the habits table.
Future<List<Habit>> habits() async {
  // Get a reference to the database.
  final Database db = await openData();

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('habits');

  // Convert the List<Map<String, dynamic> into a List<Habit>.
  return List.generate(maps.length, (i) {
    return Habit(
      id: maps[i]['id'],
      name: maps[i]['name'],
    );
  });
}


class _HabitState extends State<Habit> {
  /// A [Habit] stores its name
  IconData iconLocation = Icons.check_box_outline_blank;

  void toggle() {

    setState((){
      if(iconLocation == Icons.check_box_outline_blank) {
        iconLocation = Icons.check_box;
      }
      else {
        iconLocation = Icons.check_box_outline_blank;
      }
    });
  }

  @override

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: 90.0,
        child: InkWell(
          onTap: () => toggle(),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    iconLocation,
                    size: 40.0,
                  ),
                ),
                Center(
                  child: Text(
                    widget.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}