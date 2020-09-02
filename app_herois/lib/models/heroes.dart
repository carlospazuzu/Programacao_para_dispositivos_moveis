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
    'Black Widow',
    'Rogue',
    'Dr. Strange',
    'Ant-Man',
    'Scarlet Witch',
    'Drax',
    'Gamora',
    'Green Lantern',
    'The Flash',
    'Aquaman',
    'Shazam'
  ];

  Item getById(int id) => Item(id, heroes[id % heroes.length]);

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