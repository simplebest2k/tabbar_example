import 'package:flutter/cupertino.dart';
import 'package:tabbar_example/iosSub/cupertino_first_page.dart';

import 'animal_item.dart';

class CupertinoMain extends StatefulWidget {
  @override
  State createState() {
    return _CupertinoMain();
  }
}

class _CupertinoMain extends State<CupertinoMain> {
  CupertinoTabBar? tabBar;
  List<Animal> animalList = Animal.makeList();

  @override
  void initState() {
    super.initState();

    tabBar = CupertinoTabBar(items: [
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
          tabBar: tabBar!,
          tabBuilder: (context, value) {
            if (value == 0) {
              return CupertinoFirstPage(animalList: animalList);
            } else {
              return Container(
                child: Center(
                  child: Text('cupertino tab 2'),
                ),
              );
            }
          }
          ),
    );
  }
}