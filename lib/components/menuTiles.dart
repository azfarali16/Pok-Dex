import 'package:flutter/material.dart';


class MenuTiles extends StatelessWidget {
  const MenuTiles(this.name, this.icon, this.page,
      {Key? key})
      : super(key: key);
  final String? name;
  final String? icon;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: height * 0.06,
          child: Row(
            children: [
              Image.asset("assets/images/$icon.png", color: Colors.white,),
              Expanded(
                  child: Center(
                      child: Text(
                "$name",
                style: TextStyle(fontSize: height * 0.03, color:  Colors.white),
              )))
            ],
          ),
        ),
      ),
      onTap: () {
        debugPrint("Button pressed: $name");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ));
      },
    );
  }
}
