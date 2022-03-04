import 'package:flutter/material.dart';
import 'package:pokemon/core/components/sizeConfig.dart';

import '../core/constants/colorConst.dart';
import '../core/constants/fontweightconst.dart';
import 'my_text.dart';

class InfoPoke extends StatelessWidget {
  final String type;
  final String info;
  const InfoPoke({required this.info, required this.type,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          text: type,
          color: ColorConst.white,
          fontWeight: FontWeightConst.bold,
        ),
        FittedBox(
          child: MyText(
          text: info,
          color: ColorConst.grey,
          fontWeight: FontWeightConst.w3,
        ),
        )
      ],
    );
  }
}
