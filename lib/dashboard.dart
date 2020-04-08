import 'package:flutter/material.dart';
import 'package:habitly/habit.dart';


class Dashboard extends StatefulWidget {
  const Dashboard();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final _habits = <Habit>[];
  
  static const _habitNames = <String>[
    'Yoga',
    'no meat'
  ];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _habitNames.length; i++) {
      _habits.add(Habit(
        name: _habitNames[i],
        semanticLabel: 'not done'
      ));
    }
  }

  Widget _buildHabitWidgets() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => _habits[index],
      itemCount: _habits.length,
    );
  }


  @override
  Widget build(BuildContext context) {
    
    final listView = Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
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

    return Scaffold(
      appBar: appBar,
      body: listView,
    );    
  }
}