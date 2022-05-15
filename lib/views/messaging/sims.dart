// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:blind_assistant/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class Sims extends StatefulWidget {
  List<SimCard> sims;
  String message, phone;
  Sims({Key key, @required this.sims, this.message, @required this.phone})
      : super(key: key);

  @override
  _SimsState createState() => _SimsState();
}

class _SimsState extends State<Sims> {
  @override
  void initState() {
    super.initState();
    print(widget.message);
    print(widget.phone);
  }

  Widget build(BuildContext context) {
    // SmsMessage message = SmsMessage(widget.message, widget.phone);
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.sims.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    speak(
                        'Double tap to Send Message from sim ${widget.sims[i].slot}');
                  },
                  onDoubleTap: () {
                    sender.sendSms(SmsMessage(widget.phone, widget.message),
                        simCard: widget.sims[i]);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.deepOrangeAccent,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.sim_card_outlined,
                          color: Colors.white,
                          size: 100,
                        ),
                        Text(
                          'SIM ' + widget.sims[i].slot.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 5,
                  color: Colors.white,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
