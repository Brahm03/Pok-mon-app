import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon/core/components/boxdecoraion.dart';
import 'package:pokemon/core/components/sizeConfig.dart';
import 'package:pokemon/core/constants/PM_const.dart';
import 'package:pokemon/core/constants/colorConst.dart';
import 'package:pokemon/core/constants/iconConst.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/widgets/pokemons.dart';

class HomePage extends StatefulWidget {
  final List<Pokemon> pokemonModel;
  const HomePage({required this.pokemonModel, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  Set<Pokemon> _temp = {};
  bool _isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: getHeight(53)),
              child: Column(
                children: [
                  SizedBox(
                    height: getHeight(88),
                    width: getWidth(252),
                    child: IconConst.logo,
                  ),
                  SizedBox(
                    height: getHeight(31),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: PMconst.extrasmall,
                    height: getHeight(42),
                    width: getWidth(296),
                    decoration: MyBoxdecoration.myboxdecoration(
                        color: ColorConst.whitegrey),
                    child: TextFormField(
                      cursorColor: ColorConst.pink,
                      textCapitalization: TextCapitalization.characters,
                      controller: controller,
                      maxLines: 1,
                      onChanged: (text) {
                        _temp.clear();
                        for (Pokemon item in widget.pokemonModel) {
                          if (text.isEmpty) {
                            _temp.clear();
                            setState(() {});
                          } else if (item.name
                              .toString()
                              .toLowerCase()
                              .contains(text.toString().toLowerCase())) {
                            _temp.add(item);
                            setState(() {});
                          }
                        }
                      },
                      onTap: () {
                        setState(() {
                          _isSearch = !_isSearch;
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
        _temp.isNotEmpty
            ? Expanded(
                flex: 7,
                child: GridView.builder(
                  itemCount: _temp.toList().length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getHeight(180),
                      crossAxisSpacing: getWidth(19),
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return Pokemons(
                      tag: index,
                      ontap: () {
                        Navigator.pushNamed(context, '/info', arguments: _temp.toList()[index]);
                      },
                      name: _temp.toList()[index].name.toString(),
                      id: _temp.toList()[index].num.toString(),
                      png: _temp.toList()[index].img.toString(),
                    );
                  }),
                ))
            : Expanded(
                flex: 7,
                child: GridView.builder(
                  itemCount: widget.pokemonModel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getHeight(180),
                      crossAxisSpacing: getWidth(19),
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return Pokemons(
                      tag: index,
                      name: widget.pokemonModel[index].name.toString(),
                      id: widget.pokemonModel[index].num.toString(),
                      png: widget.pokemonModel[index].img.toString(),
                      ontap: () {
                        Navigator.pushNamed(context, '/info', arguments: [widget.pokemonModel[index], index]);
                      },
                    );
                  }),
                )),
      ],
    );
  }
}
