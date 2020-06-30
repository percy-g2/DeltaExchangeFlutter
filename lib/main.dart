import 'dart:io';

import 'package:delta_exchange/pages/Foundation.dart';
import 'package:delta_exchange/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (isIos) {
      return CupertinoApp(
        theme: CupertinoThemeData(
            barBackgroundColor: CupertinoColors.extraLightBackgroundGray,
            primaryColor: CupertinoColors.destructiveRed),
        home: HomePage(
          title: "Delta Exchange",
        ),
      );
    }  else   if (Platform.isAndroid){
      return MaterialApp(
        theme: ThemeData.dark(),
        home: HomePage(
          title: "Delta Exchange",
        ),
      );
    }
  }
}