import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../utils/log_utils.dart';

enum TtsState { playing, stopped, paused, continued }

class TextToAudioProvider extends ChangeNotifier {
  FlutterTts ftts = FlutterTts();
  TtsState ttsState = TtsState.stopped;
  int endOffSet = 0;

  Future<void> configureTts() async {
    await ftts.setLanguage('en-US');
    await ftts.setSpeechRate(1.0);
    await ftts.setSpeechRate(0.5);
    await ftts.setVolume(1.0);

    ftts.setStartHandler(() {
      print("Playing");
      ttsState = TtsState.playing;
    });
    ftts.setCompletionHandler(() {
      print("Complete");
      ttsState = TtsState.stopped;
    });
    // ftts.setCancelHandler(() {
    //   print("Cancel");
    //   ttsState = TtsState.stopped;
    // });
    ftts.setPauseHandler(() {
      dp(msg: "status", arg: "paused");
      ttsState = TtsState.paused;
    });

    ftts.setProgressHandler((text, start, end, word) {
      dp(msg: "text", arg: text);
      dp(msg: "start", arg: start);
      dp(msg: "end", arg: end);
      dp(msg: "word", arg: word);

      endOffSet = end;
      notifyListeners();
    });
    ftts.setContinueHandler(() {
      ttsState = TtsState.continued;
    });
    dp(msg: "flutter tts initialized");
    notifyListeners();
  }

  dispose() {
    ftts.stop();
  }

  speakText(String text) async {
    // dispose();
    // configureTts();
    if (ttsState.name == TtsState.paused.name) {
      ftts.pause();
      ttsState == TtsState.paused;
    } else {
      var result = await ftts.speak(text.toString());
      if (result == 1) {
        ttsState = TtsState.playing;
      }
    }

    notifyListeners();
  }

  stopSpeaking() async {
    var result = await ftts.pause();
    if (result == 1) {
      ttsState = TtsState.stopped;
    }
    notifyListeners();
  }
}
