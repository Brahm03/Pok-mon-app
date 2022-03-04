import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/screens/home/homePage.dart';
import 'package:pokemon/screens/infopage/infoPage.dart';
import 'package:pokemon/screens/mainpage.dart';
import 'package:pokemon/screens/splash_screen/splash_screen.dart';

class MyRoutes {
  Route? onGenerateRoutes(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/splash':
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case '/main':
        return MaterialPageRoute(builder: (context) => const MainPage());
      case '/home':
        return MaterialPageRoute(
            builder: (contex) => HomePage(pokemonModel: args as List<Pokemon>));
       case '/info':
        return MaterialPageRoute(
            builder: (contex) =>  InfoPage(pokemon: args as List));      
    }
  }
}
