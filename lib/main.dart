import 'package:flutter/material.dart';
import 'package:tabbar_example/cupertino_main.dart';
import 'package:tabbar_example/sub/first_page.dart';

import 'animal_item.dart';
import 'sub/second_page.dart';

void main() {
  runApp(CupertinoMain());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? _controller;
  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);

    /*animalList.add(Animal(animalName: '벌', kind: '곤충', imagePath: 'repo/images/bee.png'));
    animalList.add(Animal(animalName: '고양이', kind: '포유류', imagePath: 'repo/images/cat.png'));
    animalList.add(Animal(animalName: '젖소', kind: '포유류', imagePath: 'repo/images/cow.png'));
    animalList.add(Animal(animalName: '강아지', kind: '포유류', imagePath: 'repo/images/dog.png'));
    animalList.add(Animal(animalName: '여우', kind: '포유류', imagePath: 'repo/images/fox.png'));
    animalList.add(Animal(animalName: '원숭이', kind: '영장류', imagePath: 'repo/images/monkey.png'));
    animalList.add(Animal(animalName: '돼지', kind: '포유류', imagePath: 'repo/images/pig.png'));
    animalList.add(Animal(animalName: '늑대', kind: '포유류', imagePath: 'repo/images/wolf.png'));*/

    animalList = Animal.makeList();

    _controller?.addListener(() {
      if (!(_controller!.indexIsChanging)) {
        print('이전 index, ${_controller?.previousIndex}');
        print('현재 index, ${_controller?.index}');
      }
    });
  }



  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
      ),
      body: TabBarView(
        children: [
          FirstApp(list: animalList),
          SecondApp(list: animalList),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: TabBar(tabs: const [
        Tab(icon: Icon(Icons.looks_one, color: Colors.blue,),),
        Tab(icon: Icon(Icons.looks_two, color: Colors.blue,),),
      ], controller: _controller,),
    );
  }
}
