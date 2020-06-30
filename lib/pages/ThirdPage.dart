import 'package:flutter/material.dart';
import 'Foundation.dart';
import 'package:flutter/cupertino.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isIos) {
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text("Settings Info"),),
          child: Center(
            child: Text("Settings Page"),
          ));
    } else {
      return Scaffold(
        body: Center(
          child: Text("Settings Page"),
        ),
      );
    }
  }
}
