import 'package:flutter/material.dart';

class SideNavigation extends StatelessWidget {
  // final: 対象の変数やフィールドの値が一度設定されたら変更できなくなる. 変数が再代入されることを防ぐ.
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  // コンストラクタの定義
  const SideNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: NavigationRail(
      extended:
          MediaQuery.of(context).size.width >= 600, // true になるとアイコンの隣のラベルが表示
      destinations: [
        NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home')),
        NavigationRailDestination(
            icon: Icon(Icons.favorite), label: Text('Favorites'))
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
    ));
  }
}
