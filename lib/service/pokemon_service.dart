import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokemon/core/constants/api_const.dart';
import 'package:pokemon/models/pokemon_model.dart';

class PokemonService {
  static Future<PokemonModel> getPokemonData() async {
    Response response = await Dio().get(ApiConst.api);
    print(response.data);
    return PokemonModel.fromJson(jsonDecode(response.data));
  }
}
