import 'package:flutter/material.dart';
import 'package:namer_app/app/state.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Center(child: Text('No favorites yet.'));
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text('you have' '${favorites.length} favorites'),
          ),
          TextButton(
              onPressed: (() {
                appState.clearFavorites();
              }),
              child: Text('Clear')),
        ],
      ),
      Expanded(
          child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400, childAspectRatio: 400 / 80),
        children: [
          for (var pair in appState.favorites)
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                color: theme.colorScheme.primary,
                onPressed: () {
                  appState.removeFavorite(pair);
                },
              ),
              title: Text(
                pair.asLowerCase,
                semanticsLabel: pair.asPascalCase,
              ),
            ),
        ],
      ))
    ]);
  }
}
