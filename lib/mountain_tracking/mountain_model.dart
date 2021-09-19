class MountainModel {
  String name;
  String location;
  String image;
  String level;
  String height;
  MountainModel({required this.name, required this.location, required this.image, required this.level, required this.height});

  static final List<MountainModel> mountains = [
    MountainModel(
        name: 'Mount Bromo',
        location: 'Pasuruan, East Java, Indonesia',
        image: 'assets/images/Mount Bromo.jpg',
        level: 'Easy',
        height: '10.2 mi'),
    MountainModel(
        name: 'Mount Bunderspitz',
        location: 'Bunderspitz, Adelboden, Switzerland',
        image: 'assets/images/Mount Bunderspitz.jpg',
        level: 'Easy',
        height: '22.2 mi'),
    MountainModel(
        name: 'Mount Cook',
        location: 'Mount Cook, Nouvelle-Zélande',
        image: 'assets/images/Mount Cook.jpg',
        level: 'Medium',
        height: '32.8 mi'),
    MountainModel(
        name: 'Mount Himalayas',
        location: 'Mount Everest, Nepal',
        image: 'assets/images/Mount Himalaya.jpg',
        level: 'Hard',
        height: '98.4 mi'),
  ];
}
