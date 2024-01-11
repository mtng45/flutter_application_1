import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // アプリ全体の状態
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // アプリが機能するために必要となるデータを定義

  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners(); // 監視している MyAppState に通知
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    /**
       Scaffold は Flutterフレームワークで使用されるウィジェットの一つで、基本的なアプリケーションの骨格（スケルトン）を提供
       アプリケーションのトップレベルのウィジェットとして使用され、多くの一般的な機能を提供
       
       ・AppBar（アプリケーションバー）: 
        アプリの上部に表示されるバーで、通常はアプリのタイトルやアクションを配置するために使用されます。

       ・Body: 
        アプリケーションのメインコンテンツが配置される領域です。
        通常は Container や他のウィジェットを使用してレイアウトが構築されます。

       ・FloatingActionButton（浮動アクションボタン）: 
        通常はアプリケーションの主要なアクションを実行するための円形のボタンです。

       ・BottomNavigationBar（ボトムナビゲーションバー）: 
        アプリケーションの下部に表示され、複数の画面やセクションにナビゲートするためのボタンを提供します。

       ・Drawer: アプリケーションの左側からスライドインするサイドメニューを表示します。

       ・SnackBar: 画面の一番下に短いメッセージを表示するための小さなウィジェット。
     */
    return Scaffold(
      /**
       * Column
       *  Flutter における非常に基本的なレイアウト ウィジェット
       *  任意の数の子を従え、それらを上から下へ一列に配置
       *  デフォルトでは、その子を上に寄せる
       */
      body: Column(
        children: [
          Text('A random HogeHoge fuga idea:'),
          Text(appState.current.asLowerCase),
          ElevatedButton(
              onPressed: () {
                appState.getNext();
              },
              child: Text('Next'))
        ],
      ),
    );
  }
}
