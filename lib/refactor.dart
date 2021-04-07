import 'package:flutter/material.dart';
import 'Constants.dart';

class MyTextField extends StatelessWidget {
  MyTextField({this.icon, this.string, this.myOnChanged, this.dotDotText});
  final IconData icon;
  final String string;
  final Function myOnChanged;
  final bool dotDotText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: dotDotText,
      onChanged: myOnChanged,
      decoration: InputDecoration(
        hintText: string,
        filled: true,
        fillColor: Colors.white,
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

class MyButton extends StatelessWidget {
  MyButton({this.colour, this.string, this.myOnPressed});
  final Color colour;
  final String string;
  final Function myOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: myOnPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(string, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
