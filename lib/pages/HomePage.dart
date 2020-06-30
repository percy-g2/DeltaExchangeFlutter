import 'dart:io';

import 'package:flutter/material.dart';
import 'Foundation.dart';
import 'package:flutter/cupertino.dart';
import 'FirstPage.dart';
import 'SecondPage.dart';
import 'ThirdPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int currentTabIndex = 0;

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  List<Widget> tabs = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];

  @override
  Widget build(BuildContext context) {
    if (isIos) {
      return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart), title: Text("Chart")),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), title: Text("Settings"))
          ]),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return FirstPage();
                break;
              case 1:
                return SecondPage();
                break;
              case 2:
                return ThirdPage();
                break;
              default:
                return FirstPage();
                break;
            }
          });
    }
    //Android Scafold
    else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // Body Where the content will be shown of each page index
        body: tabs[currentTabIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentTabIndex,
            onTap: onTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), title: Text("Home")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.show_chart), title: Text("Chart")),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), title: Text("Settings"))
            ]),
      );
    }
  }
}