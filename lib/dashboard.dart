import 'package:flutter/material.dart';
import 'package:habitly/habit.dart';
import 'package:habitly/new_habit_route.dart';


class Dashboard extends StatefulWidget {
  const Dashboard();


  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Habit> _habits;

  Future _fetchHabitList() async {
    List<Habit> _habitCall = await habits();
    setState(() {
      _habits = _habitCall;
    });
  }

  @override
  void initState(){
    super.initState();
    _fetchHabitList();
  }

  Widget _buildHabitWidgets(){
    _fetchHabitList();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => _habits[index],
      itemCount: _habits.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final listView = Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: _buildHabitWidgets(),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Habitly',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        )
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );

    final addHabitButton = FloatingActionButton(
      onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewHabitRoute()),
        );
      },
      child: Icon(Icons.add),
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
      floatingActionButton: addHabitButton,
    );    
  }
}