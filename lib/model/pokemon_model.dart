import 'package:flutter/material.dart';


extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}


class Pokemon_Model {
  String? name;
  int? height;
  int? weight;
  int? base_exp; // xp u gain after def
  int? id;
  List<String> types = []; //pokemon can be of multiple type. eg charizard is fire + flying type.
  List<String> abilities = [];
  List<int> stats = [];
  //0 = hp , 1 = atk , 2 = def , 3 = sp atk , 4 = sp def , 5 = speed
  String sprite_URL = "";

  Pokemon_Model (Map<String,dynamic> data) {
    debugPrint("Constructor works");
    name = data["name"].toUpperCase();
    height = data["height"];
    weight = data["weight"];
    base_exp = data["base_experience"];
    id = data["id"];
    debugPrint("$base_exp");
    for (var typ in data["types"]) {
      types.add(typ["type"]["name"].toString().toUpperCase());
    }

    for (var abl in data["abilities"]) {
      abilities.add((abl["ability"]["name"]).toString().toUpperCase());
    }

    for (var st in data["stats"] ){
      stats.add(st["base_stat"]);
    }

    // sprite_URL = data["sprites"]["other"]["official-artwork"]["front_default"];
    sprite_URL = data["sprites"]["front_default"];

    debugPrint("Constructor ENDS");
  }
}
