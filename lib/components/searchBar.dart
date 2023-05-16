import 'package:flutter/material.dart';

class Search_Bar extends StatelessWidget {
   Search_Bar(this._text_Controller ,{Key? key}) : super(key: key);
  var _text_Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _text_Controller,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color:Colors.white),
          hintText: "Enter the pokémon name",
      ),
    );
  }
}




