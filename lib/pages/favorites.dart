import 'package:flutter/material.dart';
import 'package:namer_app/app/state.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Center(child: Text('No favorites yet.'));
    }

    return ListView(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('you have' '${favorites.length} favorites'),
          ),
          TextButton(
              onPressed: (() {
                appState.clearFavorites();
              }),
              child: Text('Clear')),
        ],
      ),
      for (var favorite in favorites)
        ListTile(
            leading: Icon(Icons.favorite), title: Text(favorite.asLowerCase)),
    ]);
  }
}
