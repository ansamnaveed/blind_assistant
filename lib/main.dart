// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables

import 'package:blind_assistant/views/home_screen.dart';
import 'package:blind_assistant/widgets/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .whenComplete(() => print('done dona done done'));
  runApp(
    MyApp(),
  );
  SmsReceiver receiver = SmsReceiver();
  receiver.onSmsReceived.listen(
    (SmsMessage msg) => speak("New Message from" + msg.sender),
  );
  sender.onSmsDelivered.listen(
    (event) {
      speak('Message delivered');
    },
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blind Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
