import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({Key? key, this.tile_name, this.tile_content}) : super(key: key);

  final String? tile_name;
  final String? tile_content;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: foreground_color_2,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(10),
      child: Text("$tile_name: $tile_content", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.white),),
    );
  }
}

class InfoTile2 extends StatelessWidget {
  const InfoTile2({Key? key, this.tile_content,}) : super(key: key);

  final String? tile_content;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Container(
      // width: width * 0.4,
      decoration: BoxDecoration(
        color: foreground_color_2,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(10),
      child: Text("$tile_content", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold , color: Colors.white), ),
    );
  }
}
