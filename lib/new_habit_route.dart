import 'package:flutter/material.dart';
import 'package:habitly/habit.dart';

class NewHabitRoute extends StatefulWidget {

  const NewHabitRoute();
  
  @override
  _NewHabitRouteState createState() => _NewHabitRouteState();
}

class _NewHabitRouteState extends State<NewHabitRoute> {

  final newHabitController = TextEditingController();

  Widget _buildForm() {
   return Column(
      children:[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: newHabitController,
          ),
        ),
        RaisedButton(
          onPressed: () {
            _addHabit();
            Navigator.pop(context);
          },
          child: Text('Save Habit'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    newHabitController.dispose();
    super.dispose();
  }

  _addHabit() async {
    Habit _newHabit = Habit(
        id: null,
        name: newHabitController.text,
    );
    insertHabit(_newHabit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Habit"),
      ),
      body: _buildForm()
    );
  }
}