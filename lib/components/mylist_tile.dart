import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/pages/pokemonInfo.dart';
import 'package:pokedex/provider/pokemonProvider.dart';
import 'package:provider/provider.dart';



class My_Tile extends StatelessWidget {
  My_Tile(this.pokemon_name, this.id ,{Key? key}) : super(key: key);

  String pokemon_name = '';
  int id = 0;

  movetoDetail(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonInfo(pokemon_name.toLowerCase())));
  }


  @override
  Widget build(BuildContext context) {
    final pMap = Provider.of<Pokemon_Provider>(context);
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => movetoDetail(context) ,
      child: Container(
        decoration: BoxDecoration(
          color: foreground_color_2,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 200,
        width: 200,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png"),
            
            Text(pokemon_name.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.03,
              ),),

            //Delete Button
            MaterialButton(
                onPressed: () => pMap.delete(id),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: foreground_color,
                    border: Border.all(width: 1.5),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child:  const Text("Delete"),
                ),
            )
            
          ],
        )
      ),
    );
  }
}
