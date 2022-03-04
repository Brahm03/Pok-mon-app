import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon/core/components/sizeConfig.dart';
import 'package:pokemon/core/constants/colorConst.dart';
import 'package:pokemon/core/constants/iconConst.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/main'));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: ColorConst.KprimaryColor),
        child: Column(
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                    padding: EdgeInsets.only(top: getHeight(200)),
                    child: IconConst.go)),
            Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconConst.avatar,
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
