import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';


class Loading_Screen extends StatelessWidget {
  const Loading_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: background_color,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Loading" , style: TextStyle(fontSize: height*0.04),),
            SizedBox(
              height: height *0.15,
                child: Image.asset("assets/animation/pokeball animating.gif",)),
          ],
        ),
      ),

    );
  }
}
