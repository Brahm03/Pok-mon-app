import 'package:flutter/material.dart';
import 'package:pokemon/core/constants/colorConst.dart';
import 'package:pokemon/core/constants/radiusconst.dart';

class MyBoxdecoration {
  static myboxdecoration({Color color = ColorConst.pink, double borderRadius = RadiusConst.small}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius)
    );
  }
}
