class Animal {
  String? imagePath;
  String? animalName;
  String? kind;
  bool? flyExist = false;

  Animal(
  {
    required this.animalName,
    required this.kind,
    required this.imagePath,
    this.flyExist
  });

  static List<Animal> makeList() {
    List<Animal> animalList = List.empty(growable: true);

    animalList.add(Animal(animalName: '벌', kind: '곤충', imagePath: 'repo/images/bee.png'));
    animalList.add(Animal(animalName: '고양이', kind: '포유류', imagePath: 'repo/images/cat.png'));
    animalList.add(Animal(animalName: '젖소', kind: '포유류', imagePath: 'repo/images/cow.png'));
    animalList.add(Animal(animalName: '강아지', kind: '포유류', imagePath: 'repo/images/dog.png'));
    animalList.add(Animal(animalName: '여우', kind: '포유류', imagePath: 'repo/images/fox.png'));
    animalList.add(Animal(animalName: '원숭이', kind: '영장류', imagePath: 'repo/images/monkey.png'));
    animalList.add(Animal(animalName: '돼지', kind: '포유류', imagePath: 'repo/images/pig.png'));
    animalList.add(Animal(animalName: '늑대', kind: '포유류', imagePath: 'repo/images/wolf.png'));

    return animalList;
  }
}