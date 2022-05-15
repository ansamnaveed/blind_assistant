// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:blind_assistant/views/messaging/number_screen.dart';
import 'package:blind_assistant/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

class WriteMessage extends StatefulWidget {
  const WriteMessage({Key key}) : super(key: key);

  @override
  _WriteMessageState createState() => _WriteMessageState();
}

class _WriteMessageState extends State<WriteMessage> {
  @override
  void initState() {
    super.initState();
    speak('click anywhere on the screen for more information.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // InkWell(
          //   onTap: () {
          //     speak(
          //         'Double tap here to add reciever phone number and long press to listen entered number.');
          //   },
          //   onLongPress: () {
          //     speak(phoneNumber);
          //   },
          //   onDoubleTap: toggleRecordingPhone,
          //   child: Container(
          //     alignment: Alignment.center,
          //     color: Colors.deepOrangeAccent,
          //     width: double.infinity,
          //     height: MediaQuery.of(context).size.height * 0.2,
          //     child: Text(
          //       phoneNumber.replaceAll(' ', ''),
          //       style: TextStyle(fontSize: 30, color: Colors.white),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () {
              speak('Double tap to start recording message.');
            },
            onDoubleTap: toggleRecording,
            child: Container(
              color: Colors.deepOrangeAccent,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.495,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LineariconsFree.mic,
                    size: 100,
                    color: Colors.white,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              speak('Double tap to enter phone number.');
            },
            onDoubleTap: () async {
              push(
                context,
                NumberScreen(message: text),
              );
              // SimCardsProvider provider = SimCardsProvider();
              // List<SimCard> sims = await provider.getSimCards();
              // if (phoneNumber == 'EMPTY') {
              //   speak('Please enter a valid phone number.');
              // } else {
              //   if (sims.length == 1) {
              //     SmsSender sender = SmsSender();
              //     SmsMessage message =
              //         SmsMessage(phoneNumber.replaceAll(' ', ''), text);
              //     sender.sendSms(message, simCard: sims[0]);
              //   } else {
              //     push(
              //       context,
              //       Sims(
              //           sims: sims,
              //           phone: phoneNumber.replaceAll(' ', ''),
              //           message: text),
              //     );
              //   }
              // }
            },
            child: Container(
              color: Colors.deepOrangeAccent,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.495,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Linecons.paper_plane,
                    color: Colors.white,
                    size: 100,
                  ),
                  Text(
                    'Send',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String text = 'Double tap to start recording message.';
  // String phoneNumber = 'EMPTY';

  Future toggleRecording() => VoiceApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
      );
  // Future toggleRecordingPhone() => VoiceApi.toggleRecording(
  //       onResult: (phoneNumber) =>
  //           setState(() => this.phoneNumber = phoneNumber),
  //     );
}
