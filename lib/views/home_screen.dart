// ignore_for_file: unused_field, prefer_const_constructors, unrelated_type_equality_checks

import 'dart:async';
import 'package:battery_plus/battery_plus.dart';
import 'package:blind_assistant/views/calling/diler.dart';
import 'package:blind_assistant/views/messaging/messaging.dart';
import 'package:blind_assistant/widgets/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Battery _battery = Battery();

  int batteryLevel;
  getBattery() async {
    batteryLevel = await _battery.batteryLevel;
    setState(() {});
  }

  BatteryState _batteryState;
  StreamSubscription<BatteryState> _batteryStateSubscription;

  // Map<String, String> voice = '{name: ur-pk-x-cfn-local, locale: ur-PK}';

  @override
  void initState() {
    super.initState();
    speak('Welcome, click anywhere on the screen for more information.');
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen((BatteryState state) {
      getBattery();
      setState(() {
        _batteryState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  speak('Double click to open Messaging.');
                },
                onDoubleTap: () {
                  push(context, Messaging());
                },
                child: Container(
                  color: Colors.deepOrangeAccent,
                  width: MediaQuery.of(context).size.width * 0.499,
                  height: MediaQuery.of(context).size.height * 0.499,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Octicons.mail_read,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width / 5),
                      Text(
                        'Messaging',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 15),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  speak('Double click for more information about calling.');
                },
                onDoubleTap: () {
                  push(context, NumberDiler());
                },
                child: Container(
                  color: Colors.deepOrangeAccent,
                  width: MediaQuery.of(context).size.width * 0.499,
                  height: MediaQuery.of(context).size.height * 0.499,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.phone,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width / 5),
                      Text(
                        'Calling',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  speak('Double click for more information about notes.');
                },
                child: Container(
                  color: Colors.deepOrangeAccent,
                  width: MediaQuery.of(context).size.width * 0.499,
                  height: MediaQuery.of(context).size.height * 0.499,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Octicons.note,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width / 5),
                      Text(
                        'Notes',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 15),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  speak('Double click for more information about battery.');
                },
                onDoubleTap: () {
                  speak('$batteryLevel %');
                },
                child: Container(
                  color: Colors.deepOrangeAccent,
                  width: MediaQuery.of(context).size.width * 0.499,
                  height: MediaQuery.of(context).size.height * 0.499,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                          _batteryState == BatteryState.charging
                              ? RpgAwesome.battery_black
                              : RpgAwesome.battery_25,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width / 5),
                      Text(
                        _batteryState == BatteryState.charging
                            ? 'Charging ($batteryLevel%)'
                            : '($batteryLevel%)',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width / 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
