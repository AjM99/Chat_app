import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chat_app/refactor.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Icon(
                FontAwesomeIcons.comments,
                size: 100,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(height: 48.0),
            MyTextField(
              icon: FontAwesomeIcons.envelope,
              string: "Enter your mail",
              dotDotText: false,
            ),
            SizedBox(height: 8.0),
            MyTextField(
              icon: FontAwesomeIcons.unlockAlt,
              string: "Enter your password",
              dotDotText: true,
            ),
            SizedBox(
              height: 24.0,
            ),
            MyButton(
              colour: Colors.lightBlueAccent,
              string: "Log In",
            ),
          ],
        ),
      ),
    );
  }
}
