import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:chat_app/refactor.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool loadingSymbol = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loadingSymbol,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //flexible makes it sync with the screen
              Flexible(
                //hero is animation style
                child: Hero(
                  tag: "logo",
                  child: Icon(
                    FontAwesomeIcons.comments,
                    size: 100,
                    color: Colors.blueGrey,
                  ),
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
                colour: Colors.lightBlueAccent,
                string: "Log In",
                myOnPressed: () async {
                  setState(() {
                    loadingSymbol = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      loadingSymbol = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
