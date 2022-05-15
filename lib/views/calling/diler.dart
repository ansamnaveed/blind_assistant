// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_types_as_parameter_names, non_constant_identifier_names, avoid_print, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:blind_assistant/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class NumberDiler extends StatefulWidget {
  NumberDiler({Key key}) : super(key: key);

  @override
  _NumberDilerState createState() => _NumberDilerState();
}

class _NumberDilerState extends State<NumberDiler> {
  @override
  void initState() {
    super.initState();
    speak(
        'Double tap the phone number to clear the last digit and swipe to make a call');
  }

  String phoneNumber = 'EMPTY';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleGestureDetector(
        onVerticalSwipe: (details) async {
          bool res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
        },
        swipeConfig: SimpleSwipeConfig(
          verticalThreshold: 150.0,
          horizontalThreshold: 150.0,
          swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                speak('Phone Number is ' + phoneNumber);
              },
              onDoubleTap: () {
                speak(phoneNumber.characters.last + 'Clear');
                setState(
                  () {
                    phoneNumber =
                        phoneNumber.split(phoneNumber.characters.last).first;
                  },
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.deepOrangeAccent,
                height: MediaQuery.of(context).size.height * 0.19,
                child: Text(
                  phoneNumber,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    speak('1');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '1';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    speak('2');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '2';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    speak('3');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '3';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 50, color: Colors.white),
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
                    speak('4');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '4';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '4',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    speak('5');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '5';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '5',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    speak('6');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '6';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '6',
                      style: TextStyle(fontSize: 50, color: Colors.white),
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
                    speak('7');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '7';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '7',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    speak('8');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '8';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '8',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    speak('9');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '9';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '9',
                      style: TextStyle(fontSize: 50, color: Colors.white),
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
                    speak('*');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '*';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '*',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    speak('0');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '0';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    speak('#');
                    if (phoneNumber == 'EMPTY') {
                      setState(() {
                        phoneNumber = '';
                      });
                    }
                    setState(() {
                      phoneNumber = phoneNumber + '#';
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      '#',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
