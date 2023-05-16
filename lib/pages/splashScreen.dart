import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/provider/pokemonProvider.dart';
import 'package:provider/provider.dart';


import 'home.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);


  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();

}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {

    // final pMap = Provider.of<Pokemon_Provider>(context);
    // pMap.load();


    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });

    super.initState();
  }

  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //
  //   // Access the inherited widget and perform necessary actions
  //   final pMap = Provider.of<Pokemon_Provider>(context);
  //   pMap.load();
  // }


  @override
  Widget build(BuildContext context) {
    final pMap = Provider.of<Pokemon_Provider>(context);
    pMap?.load();
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: background_color,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "PokéDex",
                    style: TextStyle(fontSize: height * 0.08 , fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.2,
                    child:
                    Image.asset("assets/animation/pokeball animating.gif"),
                  ),
                ],
              ),
            ),
            const Text("developer:azfarali007.aa@gmail.com"),
          ],
        ),
      ),
    );
  }
}
