import 'package:flutter/material.dart';
import 'package:pokedex/components/bg_logo.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/components/myDrawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          bg_logo,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // About heading
              Text(
                "About",
                style: TextStyle(
                  fontSize: height * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Container(
                // height * 0.6
                margin: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 15.0),
                height: (height * 0.6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width:4),
                    color: foreground_color_2,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Developed By:\n\n\"Syed Azfar Ali\"\n\nAPI Used: PokeApi",
                  style: TextStyle(
                      fontSize: height * 0.05,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
