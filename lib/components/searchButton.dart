import 'package:flutter/material.dart';
import 'package:pokedex/pages/pokemonInfo.dart';
import 'package:pokedex/constants.dart';

class Search_Button extends StatelessWidget {
  Search_Button(this.txt_Controller ,{Key? key}) : super(key: key);
  String data = '';
  var txt_Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(5),
        height: height * 0.05,
        width: width * 0.3,
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            color: foreground_color_2,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
              "Search..",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: height * 0.025,
              ),
            )),
      ),
      onTap: () {
        debugPrint("Button pressed: Search button");
        if(txt_Controller.text == ""){
          return;
        }
        data = txt_Controller.text;
        FocusManager.instance.primaryFocus?.unfocus();
        txt_Controller.clear();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonInfo(data.toLowerCase()),
            ));
      },
    );
  }
}
