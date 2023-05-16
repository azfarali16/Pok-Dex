import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';


class MyAlert extends StatelessWidget {
  MyAlert(this.doesContain, {Key? key}) : super(key: key);
  final bool doesContain;
  String content ='';
  @override
  Widget build(BuildContext context) {
    if (doesContain){
      content = "Pokemon is already in a list";
    }
    else{
      content = "Pokemon has been added to the list";
    }

    return AlertDialog(
      title: const Text("Alert" , style: TextStyle(color: Colors.white),),
      content: Text(content ?? "none", style: const TextStyle(color: Colors.white), ),
      backgroundColor: foreground_color_2,
      actions: [
        MaterialButton(
          onPressed: (){Navigator.pop(context);},
          child: (const Text("Ok" , style: TextStyle(color: Colors.white),)),
        )
      ],
    );
  }
}
