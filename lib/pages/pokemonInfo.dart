import 'package:flutter/material.dart';
import 'package:pokedex/components/loadingScreen.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/components/infoTile.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/model/service.dart';
import 'package:pokedex/provider/pokemonProvider.dart';
import 'package:provider/provider.dart';
import '../components/bg_logo.dart';

class PokemonInfo extends StatelessWidget {
  const PokemonInfo(@required this.pokemon_name, {Key? key}) : super(key: key);
  final String pokemon_name;

  @override
  Widget build(BuildContext context) {
    final pMap = Provider.of<Pokemon_Provider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background_color,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(child: bg_logo),
            FutureBuilder<Pokemon_Model>(
                future: Pokemon_Service.fetch(pokemon_name),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Loading_Screen(),
                    );
                  } else if (snapshot.hasData) {
                    var pokemon = snapshot.data;
                    return Column(
                      children: [
                        SizedBox(
                          // color: Colors.white,
                          height: height * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: foreground_color_2,
                              ),
                              child: Image.network(
                                "${pokemon?.sprite_URL}",
                                fit: BoxFit.contain,
                                // scale: .1,
                              ),
                            ),
                          ),
                        ),

                        //Pokemon Name
                        Container(
                          decoration: BoxDecoration(
                              color: foreground_color_2,
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "${pokemon?.name}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),


                        SizedBox(
                          height: height * 0.01,
                        ),

                        Wrap(
                            spacing: 8,
                            direction: Axis.horizontal,
                            children: List.generate(
                                pokemon?.types.length ?? 0,
                                (index) => InfoTile2(
                                      tile_content: pokemon?.types[index],
                                    ))),

                        SizedBox(
                          height: height * 0.01,
                        ),

                        Expanded(
                          child: SizedBox(
                            width: width * 0.9,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InfoTile(
                                          tile_name: "Height",
                                          tile_content:
                                              "${pokemon?.height} dm"),
                                      InfoTile(
                                        tile_name: "Weight",
                                        tile_content: "${pokemon?.weight} hg",
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InfoTile(
                                          tile_name: "Health",
                                          tile_content: "${pokemon?.stats[0]}"),
                                      InfoTile(
                                        tile_name: "Speed",
                                        tile_content: "${pokemon?.stats[5]}",
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InfoTile(
                                          tile_name: "Attack",
                                          tile_content: "${pokemon?.stats[1]}"),
                                      InfoTile(
                                        tile_name: "Defense",
                                        tile_content: "${pokemon?.stats[2]}",
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InfoTile(
                                          tile_name: "Sp.Attack",
                                          tile_content: "${pokemon?.stats[3]}"),
                                      InfoTile(
                                        tile_name: "Sp.Defense",
                                        tile_content: "${pokemon?.stats[4]}",
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //button 1
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: const InfoTile2(
                                          tile_content: "Go Back",
                                        ),
                                      ),

                                      //button 2
                                      GestureDetector(
                                        onTap: ()=> pMap.add(context , pokemon!.name! , pokemon!.id!),
                                        child: const InfoTile2(
                                          tile_content: "Add to list",
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(width:2),
                              color: foreground_color_2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text("No such Pokémon is found, Please check the spelling of the Pokémon",style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold, color: Colors.white) , textAlign: TextAlign.center,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const InfoTile2(
                                tile_content: "Back",
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }


}
