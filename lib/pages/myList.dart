import 'package:flutter/material.dart';
import 'package:pokedex/components/mylist_tile.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/components/myDrawer.dart';
import 'package:pokedex/components/bg_logo.dart';
import 'package:pokedex/provider/pokemonProvider.dart';
import 'package:provider/provider.dart';

class myList extends StatelessWidget {
  const myList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {




    // pMap.load();

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: background_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background_color,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      drawer: MyDrawer(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(child: bg_logo),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "My List",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: height * 0.08, fontWeight: FontWeight.bold),
                ),
              ),

              Consumer<Pokemon_Provider>(builder: (context , value , child){

                final count = value.pokemon_Map.length ?? 0;

                if(count == 0){
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(width:2),
                          color: foreground_color_2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("Your list is Empty!\nAdd your favourite pokemons in the list!",style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold, color: Colors.white) , textAlign: TextAlign.center,),
                      ),
                    ],
                  );
                }
                else{
                  return  Expanded(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:2,
                          crossAxisSpacing: 8,
                        ),
                        itemCount: count,
                        itemBuilder: (context , index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            //value.pokemon_Map[index]
                            child: My_Tile(value.pokemon_Map.values.elementAt(index), value.pokemon_Map.keys.elementAt(index) ),
                          );

                        }),
                  );
                }

              })
            ],
          ),
        ],
      ),
    );
  }
}
