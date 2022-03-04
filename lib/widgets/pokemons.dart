import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/core/components/boxdecoraion.dart';
import 'package:pokemon/core/components/sizeConfig.dart';
import 'package:pokemon/core/constants/colorConst.dart';
import 'package:pokemon/core/constants/fontsize.dart';
import 'package:pokemon/core/constants/fontweightconst.dart';
import 'package:pokemon/widgets/my_text.dart';

class Pokemons extends StatelessWidget {
  final String png;
  final String id;
  final String name;
  final VoidCallback ontap;
  final int tag;
  const Pokemons({required this.tag,required this.ontap,required this.id, required this.name,required this.png,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(children: [
      Hero(
        tag: tag,
        child: Container(
            margin:const EdgeInsets.only(top: 50),
            height: getHeight(180),
            width: getWidth(177),
            decoration: MyBoxdecoration.myboxdecoration(),
        ),
      ),
      Positioned(left: getWidth(6),bottom: getHeight(10),child: InkWell(
        onTap: ontap,
        child: Container(
            height: getHeight(30),
            width: getWidth(160),
            decoration: MyBoxdecoration.myboxdecoration(color: ColorConst.grey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyText(text: '# $id', size: FontSizeConst.small,fontWeight: FontWeightConst.bold, color: ColorConst.pink,),
                SizedBox(width: getWidth(90),child: FittedBox(child: MyText(text: name, size: FontSizeConst.small,fontWeight: FontWeightConst.bold,),))
              ],
            ),
          ),
      ),),
      Positioned(left: getWidth(20),bottom: getHeight(40),child: Image.network(png))
    ]);
  }
}
