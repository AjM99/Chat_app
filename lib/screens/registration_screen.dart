import 'package:chat_app/refactor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;

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
              myOnChanged: (value) {
                email = value;
              },
            ),
            SizedBox(height: 8.0),
            MyTextField(
              icon: FontAwesomeIcons.unlockAlt,
              string: "Enter your password",
              dotDotText: true,
              myOnChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 24.0),
            MyButton(
              colour: Colors.blueAccent,
              string: "Register",
              myOnPressed: () {
                print(email);
                print(password);
              },
            ),
          ],
        ),
      ),
    );
  }
}
