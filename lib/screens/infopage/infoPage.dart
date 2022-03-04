import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon/core/components/boxdecoraion.dart';
import 'package:pokemon/core/components/sizeConfig.dart';
import 'package:pokemon/core/constants/PM_const.dart';
import 'package:pokemon/core/constants/colorConst.dart';
import 'package:pokemon/core/constants/fontweightconst.dart';
import 'package:pokemon/core/constants/iconConst.dart';
import 'package:pokemon/core/constants/radiusconst.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/widgets/info_of_poke.dart';
import 'package:pokemon/widgets/my_text.dart';
import 'package:pokemon/widgets/pokemons.dart';

class InfoPage extends StatefulWidget {
  final List pokemon;

  const InfoPage({required this.pokemon, Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPage();
}

class _InfoPage extends State<InfoPage> {
  TextEditingController controller = TextEditingController();
  Color color = ColorConst.pink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(
                    top: getHeight(53), left: getWidth(10), right: getWidth(0)),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BackButton(),
                        Container(
                          alignment: Alignment.center,
                          padding: PMconst.extrasmall,
                          height: getHeight(42),
                          width: getWidth(266),
                          decoration: MyBoxdecoration.myboxdecoration(
                              color: ColorConst.whitegrey),
                          child: const MyText(
                            text: 'Buscar Pokémon',
                            color: ColorConst.grey,
                            fontWeight: FontWeightConst.w2,
                          ),
                        ),
                        Row(
                          children: [
                            IconConst.info,
                            DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    onTap: () {},
                                    items: const [
                                      DropdownMenuItem(
                                        child: CircleAvatar(
                                          radius: RadiusConst.small,
                                          backgroundColor: Colors.amber,
                                        ),
                                        value: Colors.amber,
                                      ),
                                      DropdownMenuItem(
                                        child: CircleAvatar(
                                            radius: RadiusConst.small,
                                            backgroundColor: Colors.blueAccent),
                                        value: Colors.blueAccent,
                                      ),
                                      DropdownMenuItem(
                                        child: CircleAvatar(
                                          radius: RadiusConst.small,
                                          backgroundColor:
                                              CupertinoColors.activeGreen,
                                        ),
                                        value: CupertinoColors.activeGreen,
                                      ),
                                    ],
                                    onChanged: (v) {
                                      setState(() {
                                        color = v as Color;
                                      });
                                    })),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 7,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Hero(
                        tag: widget.pokemon[1],
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: getHeight(210),
                          width: getWidth(371),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    text:
                                        '#${widget.pokemon[0].num.toString()}',
                                    color: color,
                                    fontWeight: FontWeightConst.bold,
                                  ),
                                  MyText(
                                    text: widget.pokemon[0].name.toString(),
                                    color: ColorConst.grey,
                                    fontWeight: FontWeightConst.bold,
                                  )
                                ],
                              ),
                              Container(
                                height: getHeight(144),
                                width: getWidth(371),
                                decoration: MyBoxdecoration.myboxdecoration(
                                    color: color),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: getWidth(120),
                          child: Image.network(widget.pokemon[0].img!))
                    ],
                  ),
                  const Spacer(),
                  Stack(children: [
                    Container(
                      padding: PMconst.large,
                      height: getHeight(309),
                      decoration: MyBoxdecoration.myboxdecoration(
                          borderRadius: RadiusConst.extralarge, color: color),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InfoPoke(
                                          info: widget.pokemon[0].height
                                              .toString(),
                                          type: 'Catagoria'),
                                      InfoPoke(
                                          info:
                                              widget.pokemon[0].type.toString(),
                                          type: 'Altura'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InfoPoke(
                                          info: widget.pokemon[0].weight
                                              .toString(),
                                          type: 'Peso'),
                                      InfoPoke(
                                          info: widget.pokemon[0].spawnChance
                                              .toString(),
                                          type: 'Sexo'),
                                    ],
                                  ),
                                  InfoPoke(
                                      info: widget.pokemon[0].candyCount
                                          .toString(),
                                      type: 'Hobilidates')
                                ],
                              )),
                          Expanded(flex: 3, child: Column()),
                        ],
                      ),
                    ),
                    Positioned(
                      left: getWidth(177),
                      bottom: 0,
                      child: IconConst.poco,
                      height: getHeight(118),
                      width: getWidth(233),
                    )
                  ])
                ],
              ))
        ],
      ),
    );
  }
}
