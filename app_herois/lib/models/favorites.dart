import 'package:app_herois/models/heroes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class FavoritesModel extends ChangeNotifier {

  HeroesModel _heroes;

  final List<int> _heroesIds = [];

  HeroesModel get heroes => _heroes;

  set heroes(HeroesModel newHeroes) {
    _heroes = newHeroes;
    notifyListeners();
  }

  List<Item> get heroesList => _heroesIds.map((id) => _heroes.getById(id)).toList();

  void add(Item item) {
    _heroesIds.add(item.id);

    notifyListeners();
  }
}