import 'package:flutter/material.dart';
import 'Foundation.dart';
import 'package:flutter/cupertino.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isIos) {
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text("Chart"),),
          child: Center(
            child: Text("Chart Page"),
          ));
    } else {
      return Scaffold(
        body: Center(
          child: Text("Chart Page"),
        ),
      );
    }
  }
}
