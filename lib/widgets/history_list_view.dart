import 'package:flutter/material.dart';
import 'package:namer_app/app/state.dart';
import 'package:provider/provider.dart';

class HistoryListView extends StatefulWidget {
  static const Gradient _maskingGradient = LinearGradient(
    // このグラデーションは、完全に透明な黒から完全に不透明な黒になります。
    colors: [Colors.transparent, Colors.black],
    // 上（透明）から下までの半分（0.5）まで。
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  // [MyAppState] が以下の [AnimatedList] に新しいアイテムをアニメーション化するように指示できるようにするために必要です。
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    appState.historyListKey = _key;

    return ShaderMask(
        shaderCallback: ((bounds) =>
            HistoryListView._maskingGradient.createShader(bounds)),
        blendMode: BlendMode.dstIn,
        child: AnimatedList(
            key: _key,
            reverse: true,
            padding: EdgeInsets.only(top: 100),
            initialItemCount: appState.history.length,
            itemBuilder: (context, index, animation) {
              final pair = appState.history[index];
              return SizeTransition(
                  sizeFactor: animation,
                  child: Center(
                    child: TextButton.icon(
                      onPressed: (() {
                        appState.toggleFavorite(pair);
                      }),
                      icon: appState.favorites.contains(pair)
                          ? Icon(Icons.favorite, size: 12)
                          : SizedBox(),
                      label: Text(pair.asLowerCase,
                          semanticsLabel: pair.asPascalCase),
                    ),
                  ));
            }));
  }
}
