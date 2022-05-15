// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:blind_assistant/views/messaging/inbox.dart';
import 'package:blind_assistant/views/messaging/write_message.dart';
import 'package:blind_assistant/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key key}) : super(key: key);

  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  @override
  void initState() {
    super.initState();
    speak('Click anywhere on the screen for more information about Messaging.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              speak('Write a new message');
            },
            onDoubleTap: () {
              push(
                context,
                WriteMessage(),
              );
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.deepOrangeAccent,
              width: double.infinity,
              height: (MediaQuery.of(context).size.height * 0.5) - 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesome.edit,
                    size: 100,
                    color: Colors.white,
                  ),
                  Text(
                    'Write Message',
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              speak('Inbox');
            },
            onDoubleTap: () {
              push(
                context,
                Inbox(),
              );
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.deepOrangeAccent,
              width: double.infinity,
              height: (MediaQuery.of(context).size.height * 0.5) - 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Linecons.inbox,
                    size: 100,
                    color: Colors.white,
                  ),
                  Text(
                    'Inbox',
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
