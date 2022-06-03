import 'package:flutter/material.dart';

class ThreadLogic extends ChangeNotifier {
  String text = "paste or type your tweet";
  int tweetLen = 280;
  List thread = [];

  makeThread() {
    num len = text.length / tweetLen;

    var newLen = len.ceil();

    for (var i = 0; i < newLen; i++) {
      var initItem = i * tweetLen;
      String initText = "";

      for (var j = initItem; j < initItem + tweetLen; j++) {
        if (j < text.length) {
          initText = initText + text[j];
        }
      }
      thread.add(initText);
    }
    notifyListeners();
  }
}
