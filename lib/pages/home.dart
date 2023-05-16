import 'package:flutter/material.dart';
import 'package:pokedex/components/bg_logo.dart';
import 'package:pokedex/components/myDrawer.dart';
import 'package:pokedex/components/searchBar.dart';
import 'package:pokedex/components/searchButton.dart';
import 'package:pokedex/constants.dart';


class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
   var txt_Controller = TextEditingController();

   @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background_color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background_color,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 11, 0, 0),
        child: Stack(alignment: Alignment.center, children: [
          bg_logo,
          Column(
            children: [
              Center(
                  child: Text("PokéDex",
                      style: TextStyle(
                          fontSize: height * 0.08,
                          fontWeight: FontWeight.bold))),

              //Search Bar
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: foreground_color_2,
                      borderRadius: BorderRadius.circular(10)),
                  child: Search_Bar(txt_Controller),
                ),
              ),

              //Search Button
              Search_Button(txt_Controller),

            ],
          ),
        ]),
      ),
    );
  }
}
