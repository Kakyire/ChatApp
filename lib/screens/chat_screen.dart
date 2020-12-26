import 'package:chatapp/auth/user_authentication.dart';
import 'package:chatapp/utils/constants.dart';
import 'package:chatapp/widgets/custom_rounded_textfield.dart';
import 'package:chatapp/widgets/messages_stream_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _messageController = TextEditingController();
  UserAuthentication _userAuthentication;
  bool _enableSendButton = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _getMessages() async {
    final messages = await _firestore.collection(kMessageCollection).get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  void _sendMessage() {
    _firestore.collection(kMessageCollection).add({
      kText: _messageController.text,
      kSender: _userAuthentication.loggedInUser(),
      kTimeStamp: FieldValue.serverTimestamp()
    });
    _messageController.clear();
  }

  void _messageStream() async {
    await for (var snapshot
        in _firestore.collection(kMessageCollection).snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data()[kText]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _userAuthentication = UserAuthentication(context: context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _userAuthentication.signOut();
              })
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MessagesStreamBuilder(),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RoundedTextField(
                      hintColor: Colors.white54,
                      textColor: Colors.white,
                      cursorColor: Colors.white,
                      filled: true,
                      fillColor: Colors.black45,
                      hint: 'Type something',
                      controller: _messageController,
                      onChanged: (value) {
                        setState(() {
                          if (_messageController.text.isNotEmpty) {
                            _enableSendButton = true;
                          }
                        });
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _enableSendButton ? _sendMessage() : null,
                  iconSize: 40.0,
                  color: kAppBlueColor,
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
