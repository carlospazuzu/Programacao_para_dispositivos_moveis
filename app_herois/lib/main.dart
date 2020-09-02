import 'package:app_herois/models/favorites.dart';
import 'package:app_herois/models/heroes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_herois/screens/heroeslist.dart';
import 'package:app_herois/screens/favoritespage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => HeroesModel()
        ),
        ChangeNotifierProxyProvider<HeroesModel, FavoritesModel>(
          create: (context) => FavoritesModel(),
          update: (context, heroes, favorites) {
            favorites.heroes = heroes;
            return favorites;
          },
        )
      ],
      child: MaterialApp(
        title: 'Heroes App',
        initialRoute: '/',
        routes: {
          '/': (context) => HeroesListScreen(),
          '/favorites': (context) => FavoritesPage()
        },
      ),
    );
  }
}