import 'package:flutter/material.dart';
import 'package:pokemon/core/constants/PM_const.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/screens/home/homePage.dart';
import 'package:pokemon/service/pokemon_service.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:  PMconst.medium,
        child: FutureBuilder(
          future: PokemonService.getPokemonData(),
          builder: ((context,AsyncSnapshot<PokemonModel> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Container(),
              );
            } else {
              return HomePage(pokemonModel: snapshot.data!.pokemon as List<Pokemon>,);
            }
          }),
        ),
      ),
    );
  }
}
