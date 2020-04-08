import 'package:flutter/material.dart';

/// Information about a [Habit].
class Habit extends StatefulWidget {

  Habit({ Key key, this.name, this.semanticLabel});

  final String name;
  final String semanticLabel;

  @override
  _HabitState createState() => _HabitState();
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
        height: 100.0,
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