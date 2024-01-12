import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  // アプリが機能するために必要となるデータを定義

  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners(); // 監視している MyAppState に通知
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void clearFavorites() {
    favorites.clear();
    notifyListeners();
  }
}
