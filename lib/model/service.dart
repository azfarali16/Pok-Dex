import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pokemon_model.dart';

class Pokemon_Service {
   static Future<Pokemon_Model> fetch(String pokemon) async {
    var response = await http
        .get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$pokemon"));
    if (response.statusCode == 200) {
      debugPrint("Fetch success");
      var data = json.decode(response.body);
      debugPrint("decode success");
      return Pokemon_Model(data);
    } else {
      debugPrint("Fetch failed");
      throw Exception();
    }
  }
}
