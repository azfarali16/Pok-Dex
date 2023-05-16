import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/pages/splashScreen.dart';
import 'package:pokedex/provider/pokemonProvider.dart';
import 'package:provider/provider.dart';


void main() async {

  //binding the flutter framework to the app
  WidgetsFlutterBinding.ensureInitialized();

  //initializing
  await Hive.initFlutter();

  await Hive.openBox("pBox");
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Pokemon_Provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PokéDex',
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: "Pixeloid",
        ),
        home: const Splash_Screen(), // home page
      ),
    );
  }
}

