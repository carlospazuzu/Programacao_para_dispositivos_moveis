import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_herois/models/heroes.dart';
import 'package:app_herois/models/favorites.dart';

class HeroesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HeroAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 12,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _HeroesList(index)
            ),
          )
        ],
      )      
    );
  }
}

class _HeroesList extends StatelessWidget {
  final int index;

  _HeroesList(this.index);

  @override
  Widget build(BuildContext context) {
    var item = context.select<HeroesModel, Item>(
      (hero) => hero.getByPosition(index),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,        
        child: Row(
          children: [
            Expanded(
              child: Text(item.name)
            ),
            SizedBox(
              width: 24
            ),
            _AddButton(item: item),
          ],
        ),
      )
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({@required this.item});
  @override
  Widget build(BuildContext context) {
    var isFavorited = context.select<FavoritesModel, bool>(
      (favorites) => favorites.heroesList.contains(item),
    );

    return FlatButton(
      onPressed: isFavorited
        ? null
        : () {
          var favorite = context.read<FavoritesModel>();
          favorite.add(item);
        },
      splashColor: Colors.yellow,
      child: isFavorited ? Icon(Icons.check, semanticLabel: 'ADDED') : Text('ADD')
    );
  }
}

class HeroAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Heroes List'),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () => Navigator.pushNamed(context, 'favorites'),
        )
      ],
    );
  }
}