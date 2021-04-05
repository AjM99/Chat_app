import 'package:flutter/material.dart';
import 'Constants.dart';

class MyTextField extends StatelessWidget {
  MyTextField({this.icon, this.string});
  final IconData icon;
  final String string;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        //Do something with the user input.
      },
      decoration: InputDecoration(
        hintText: string,
        filled: true,
        fillColor: Colors.blueGrey[400],
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey[800], width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
