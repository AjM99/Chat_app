import 'package:flutter/material.dart';
import 'package:chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static String id = "chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //the controller is to clear the text after send button is pressed
  final myMessageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  User loggedInUser;
  String message;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  // void displayMessages() async {
  //   final myMessages = await _fireStore.collection('messages').get();
  //   for (var myMessages in myMessages.docs) {
  //     print(myMessages.data());
  //   }
  // }

  void messageStream() async {
    await for (var snapshot in _fireStore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                messageStream();
                // _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //this is for displaying the data/messages form firebase  to my app
            StreamBuilder<QuerySnapshot>(
              stream: _fireStore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                List<MyMessageBox> messageWidgets = [];
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  );
                }
                final messages = snapshot.data.docs;

                for (var message in messages) {
                  final messageText = message.data()['text'];
                  final messageSender = message.data()['sender'];

                  final myMessageBox = MyMessageBox(
                    sender: messageSender,
                    text: messageText,
                  );
                  messageWidgets.add(myMessageBox);
                }

                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    children: messageWidgets,
                  ),
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: myMessageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      _fireStore.collection('messages').add({
                        'text': message,
                        'sender': loggedInUser.email,
                      });
                      myMessageTextController.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//this is to design the textBox/bubble/cloud
class MyMessageBox extends StatelessWidget {
  MyMessageBox({this.sender, this.text});

  final String sender;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$sender", style: TextStyle(fontSize: 13)),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(35),
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '$text',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
