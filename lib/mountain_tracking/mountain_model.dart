class MountainModel {
  String name;
  String location;
  String image;
  String level;
  String height;
  List<String> teams;
  MountainModel(
      {required this.name, required this.location, required this.image, required this.level, required this.height, required this.teams});

  static const List<String> _images = [
    'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
    'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
    'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
    'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
  ];

  static final List<MountainModel> mountains = [
    MountainModel(
        name: 'Mount Bromo',
        location: 'Pasuruan, East Java, Indonesia',
        image: 'assets/images/Mount Bromo.jpg',
        level: 'Easy',
        height: '10.2 mi',
        teams: _images),
    MountainModel(
      name: 'Mount Bunderspitz',
      location: 'Bunderspitz, Adelboden, Switzerland',
      image: 'assets/images/Mount Bunderspitz.jpg',
      level: 'Easy',
      height: '22.2 mi',
      teams: _images,
    ),
    MountainModel(
        name: 'Mount Cook',
        location: 'Mount Cook, Nouvelle-Zélande',
        image: 'assets/images/Mount Cook.jpg',
        level: 'Medium',
        height: '32.8 mi',
        teams: _images),
    MountainModel(
        name: 'Mount Himalayas',
        location: 'Mount Everest, Nepal',
        image: 'assets/images/Mount Himalaya.jpg',
        level: 'Hard',
        height: '98.4 mi',
        teams: _images),
  ];
}
