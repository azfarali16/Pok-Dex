import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/components/menuTiles.dart';
import 'package:pokedex/pages/about.dart';
import 'package:pokedex/pages/home.dart';
import 'package:pokedex/pages/myList.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        backgroundColor: color1,
        child: Column(
          children: [
            const SafeArea(child: Header()),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),
            const MenuItems(),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.12,
      child: Text(
        "Menu",
        style: TextStyle(
          color: Colors.white,
          fontSize: height * 0.06,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        MenuTiles("Home", "home_icon", Home()),
        MenuTiles("My List", "list_icon", myList()),
        MenuTiles("About", "about_icon", AboutPage()),
      ],
    );
  }
}
