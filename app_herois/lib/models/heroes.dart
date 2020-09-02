import 'package:flutter/material.dart';

class HeroesModel {
  static List<String> heroes = [
    'Spider Man',
    'Thor',
    'Iron Man',
    'Hulk',
    'Batman',
    'Wonder Woman',
    'HawkEye',
    'SuperMan',
    'QuickSilver',
    'Captain America',
    'Black Widow'
  ];

  Item getById(int id) => Item(id, heroes[id]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;

  Item(this.id, this.name);

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}