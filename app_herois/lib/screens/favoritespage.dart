import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_herois/models/favorites.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Color(0xffC78283),
      ),
      body: Container(
        color: Color(0xffD7BEA8),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _FavoritesList(),
              ),
            ),
            Divider(
              height: 4, 
              color: Colors.black,
            )
          ],
        )
      )
    );
  }
}

class _FavoritesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favorites = context.watch<FavoritesModel>();
    return ListView.builder(
      itemCount: favorites.heroesList.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: Text(
          favorites.heroesList[index].name
        ),
      ),
    );
  }
}