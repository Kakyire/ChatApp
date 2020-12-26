import 'package:chatapp/auth/user_authentication.dart';
import 'package:chatapp/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'message_bubble.dart';

class MessagesStreamBuilder extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        List<MessageBubble> messageWidgets = [];
        if (snapshot.hasData) {
          for (var message in snapshot.data.docs) {
            final messages = message.data()[kText];
            final sender = message.data()[kSender];
            bool isSender =
                sender == UserAuthentication().loggedInUser(); //false;

            final messageText = MessageBubble(isSender, message: messages);
            messageWidgets.add(messageText);
          }
        }

        return Expanded(
          child: ListView(
            reverse: true,
            children: messageWidgets,
          ),
        );
      },
      stream: _firestore
          .collection(kMessageCollection)
          .orderBy(kTimeStamp, descending: true)
          .snapshots(),
    );
  }
}
