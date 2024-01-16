import 'package:flutter/material.dart';
import 'package:namer_app/views/favorites.dart';
import 'package:namer_app/views/generator.dart';
import 'package:namer_app/widgets/side_navigation.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 先頭がアンダースコア（_）なのでクラスが非公開
class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // 現在のページのコンテナ。背景色と微妙な切り替えアニメーションが含まれます。
    var mainArea = ColoredBox(
        color: colorScheme.surfaceVariant,
        child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200), child: page));

    // LayoutBuilder の builder コールバックは、制約が変化するたびに呼び出され
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: Row(
        children: [
          // 子がハードウェア ノッチやステータスバーで隠れないようにするもの
          // モバイル ステータスバーなどで隠されるのを防いでいる
          SafeArea(
              child: SideNavigation(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  })),
          // 残りのスペースをできる限り埋める
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: mainArea,
          ))
        ],
      ));
    });
  }
}
