import 'package:flutter/material.dart';
import 'package:pokemon/core/constants/colorConst.dart';
import 'package:pokemon/core/constants/fontsize.dart';
import 'package:pokemon/core/constants/fontweightconst.dart';

class MyText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double size;
  final Color color;
  const MyText(
      {this.size = FontSizeConst.medium,
      required this.text,
      this.color = ColorConst.white,
      this.fontWeight = FontWeightConst.normal,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
