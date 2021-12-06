import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../animal_item.dart';

class SecondApp extends StatefulWidget {
  List<Animal>? list;

  SecondApp({Key? key, @required this.list}) : super(key: key);

  @override
  _SecondAppState createState() => _SecondAppState();
}

class _SecondAppState extends State<SecondApp> {
  final _nameController = TextEditingController();
  int? _radioValue = 0;
  bool? flyExist = false;
  String? _imagePath;
  List<String> images = [
    'cow.png',
    'pig.png',
    'bee.png',
    'cat.png',
    'dog.png',
    'fox.png',
    'monkey.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange,),
                        Text('양서류'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange,),
                        Text('파충류'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange,),
                        Text('포유류'),
                      ],
                    ),

                    /*Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange,),
                    Text('파충류'),
                    Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange,),
                    Text('포유류'),*/
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                Row(
                  children: [
                    Text('날 수 있나요?'),
                    Checkbox(value: flyExist, onChanged: (bool? check) {
                      setState(() {
                        flyExist = check;
                      });
                    }),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: images.map((e) {
                      return GestureDetector(
                        child: Image.asset('repo/images/$e', width: 80,),
                        onTap: () {
                          _imagePath = 'repo/images/$e';
                        },
                      );
                    }).toList(),
                  ),
                ),
                ElevatedButton(onPressed: () {
                  var animal = Animal(
                    animalName: _nameController.value.text,
                    kind: getKind(_radioValue),
                    imagePath: _imagePath,
                    flyExist: flyExist
                  );

                  showOkCancelAlertDialog(context: context,
                      title: '동물추가하기',
                      message: '이 동물은 ${animal.animalName} 입니다. '
                          '또 이 동물의 종류는 ${animal.kind} 입니다.\n이 동물을 추가하시겠습니까?')
                      .then((value) => null);


                }, child: Text('동물 추가하기')),
              ],
            ),
          ),
        )
    );
  }

  void _radioChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  getKind(int? radioValue) {
    switch(radioValue) {
      case 0:
        return '양서류';
      case 1:
        return '파충류';
      case 2:
        return '포유류';
    }
  }
}
