import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];

  // AnimatedListのキーとして使用
  GlobalKey? historyListKey;

  // 次へボタンハンドラー
  void getNext() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners(); // 監視している MyAppState に通知
  }

  var favorites = <WordPair>[];

  // お気に入りに追加・削除
  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  // 該当のpairを削除
  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }

  // favoritesをクリア
  void clearFavorites() {
    favorites.clear();
    notifyListeners();
  }
}
