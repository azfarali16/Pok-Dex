import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/components/myAlert.dart';
import 'package:pokedex/boxes/boxes.dart';

class Pokemon_Provider with ChangeNotifier {
  //storing id and pokemon in key-value pair
  Map<int, String> _pokemon_Map = {};

  //get function
  Map<int, String> get pokemon_Map => _pokemon_Map;

  final pokeBox = Boxes.getData();

  //adding function w/o hive
  void add(BuildContext context, String p_name, int id) {
    p_name = p_name.toLowerCase();
    if (!pokemon_Map.containsValue(p_name)) {
      _pokemon_Map[id] = p_name.toLowerCase();

      //updating database
      update();

      showDialog(
          context: context,
          builder: (BuildContext) {
            return MyAlert(false);
          });
    } else {
      print("Already in a List");
      // print(_pokemon_Map);
      showDialog(
          context: context,
          builder: (BuildContext) {
            return MyAlert(true);
          });
    }
  }

  //adding with hive

  void update(){
    pokeBox.put(0, _pokemon_Map );
    print(pokeBox.get(0));
  }


  Future<void> load() async{
    //dynamic
    var map = await pokeBox.get(0);
    //I got the map in InternalLinked HashMap (dynamic,dynamic)
    //converting to Map<int,String>
    _pokemon_Map = map.cast<int,String>();
  }







  //deleting function w/o hive
  void delete(int id) {
    _pokemon_Map.remove(id);
    //updating database
    update();
    notifyListeners();
  }
}
