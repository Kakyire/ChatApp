import 'package:chatapp/auth/user_authentication.dart';
import 'package:chatapp/utils/constants.dart';
import 'package:chatapp/widgets/custom_rounded_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _messageController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    _getMessages();
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
        actions: [IconButton(icon: Icon(Icons.close), onPressed: () {})],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: RoundedTextField(
                    hint: 'Type something',
                    controller: _messageController,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _firestore.collection(kMessageCollection).add({
                      kText: _messageController.text,
                      kSender: UserAuthentication().loggedInUser()
                    });
                    _messageController.clear();
                  },
                  iconSize: 40.0,
                  color: kAppBlueColor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
