import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:sms/sms.dart';

final FlutterTts _tts = FlutterTts();
push(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

pushReplacement(BuildContext context, Widget widget) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

SmsSender sender = SmsSender();

speak(String speak) async {
  // await _tts.setLanguage('ur-PK');
  await _tts.setLanguage('en-US');
  await _tts.setPitch(1.0);
  await _tts.speak(speak);
}

speakUrdu(String speak) async {
  await _tts.setLanguage('ur-PK');
  // await _tts.setLanguage('en-US');
  await _tts.setPitch(1.0);
  await _tts.speak(speak);
}

class VoiceApi {
  static final _speach = SpeechToText();
  static Future<bool> toggleRecording(
      {@required Function(String text) onResult}) async {
    final isAvailable = await _speach.initialize();

    if (isAvailable) {
      _speach.listen(onResult: (value) => onResult(value.recognizedWords));
    }

    return isAvailable;
  }
}
