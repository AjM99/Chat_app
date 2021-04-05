import 'package:chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //------------------------------------------------------------------------------------------------------------------

  //yo this is the main jam.you can control entire animation because of this
  //this wil be same for all projects,all apps
  AnimationController myController;
  Animation myAnimation;
  Animation myColorAnimation;

  @override
  void initState() {
    super.initState();
    myController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    myAnimation =
        CurvedAnimation(parent: myController, curve: Curves.bounceOut);
    myColorAnimation = ColorTween(begin: Colors.blue[100], end: Colors.white)
        .animate(myController);
    myController.forward();
    myController.addListener(() {
      setState(() {});
      print(myAnimation.value);
    });
  }

//this is necessary as if we don't dispose it off,
// it will continue to happen in background even after we move to new screen
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
//------------------------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColorAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //for logo and chat app
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: "logo",
                    child: Icon(
                      FontAwesomeIcons.comments,
                      size: myAnimation.value * 100,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(width: 25.0),
                  Text(
                    "Chat App",
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),

            //for buttons
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),

            //this is row for 'privacy' stuff
            Expanded(
              child: Row(
                children: <Widget>[
                  Text(
                    "Privacy is",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: 10.0),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey[800],
                    ),
                    child: AnimatedTextKit(
                      //repeatForever: true,
                      totalRepeatCount: 10,
                      animatedTexts: [
                        RotateAnimatedText("not a choice"),
                        RotateAnimatedText("a right"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
