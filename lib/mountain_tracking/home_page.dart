import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:ui_slicing/mountain_tracking/mountain_model.dart';

class MountainTrackingHomeView extends StatefulWidget {
  const MountainTrackingHomeView({Key? key}) : super(key: key);

  @override
  State<MountainTrackingHomeView> createState() => _MountainTrackingHomeViewState();
}

class _MountainTrackingHomeViewState extends State<MountainTrackingHomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sS = MediaQuery.of(context).size;
    final tS = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appHeader(tS),
              invitationCard(tS),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(child: Text('Hikes Near You', style: tS.headline6?.apply(color: Colors.black, fontWeightDelta: 1))),
                    Text(
                      'See All',
                      style: tS.caption?.apply(color: Colors.black, fontWeightDelta: 2),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: sS.height / 1.7,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: MountainModel.mountains.length,
                  itemBuilder: (context, index) =>
                      mountainItem(MountainModel.mountains[index], sS, tS, index, MountainModel.mountains.length),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedIconTheme: const IconThemeData(color: Colors.black38),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_rounded,
            ),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_rounded),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget mountainItem(MountainModel mountain, Size sS, TextTheme tS, int index, int count) {
    var commonPadding = const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16);
    if (index == 0) {
      commonPadding = const EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 16);
    } else if (index == count) {
      commonPadding = const EdgeInsets.only(left: 8, right: 16, top: 16, bottom: 16);
    }
    List<String> _images = [
      'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
      'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
      'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
      'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
    ];
    return Padding(
      padding: commonPadding,
      child: Container(
          width: sS.width / 1.5,
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(image: AssetImage(mountain.image), fit: BoxFit.cover)),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            child: const Icon(Icons.favorite_outline_rounded)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          mountain.name,
                          style: tS.headline6?.apply(color: Colors.black, fontWeightDelta: 2),
                        )),
                        Text(mountain.height, style: tS.caption?.apply(color: Colors.black, fontWeightDelta: 2))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Difficulty: ',
                          style: tS.caption?.apply(color: Colors.black),
                        ),
                        Text(
                          mountain.level,
                          style: tS.caption?.apply(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    ImageStack(
                      imageRadius: 30,
                      imageList: _images,
                      totalCount: _images.length,
                      imageCount: _images.length,
                      imageBorderColor: Colors.white,
                    ),
                    Text(
                      '+12 others',
                      style: tS.caption?.apply(color: Colors.black),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  color: Colors.black,
                  onPressed: () {},
                  child: SizedBox(
                      width: double.infinity, child: Center(child: Text('Join Trip', style: tS.button?.apply(color: Colors.white)))),
                )
              ],
            ),
          )),
    );
  }

  Widget invitationCard(TextTheme tS) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/me.jpg'),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text('You have been invited to join a hike to Mt. Elbert with robert and 4 others 🤟🏻',
                        style: tS.bodyText1?.apply(color: Colors.black)),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text('Cancel', style: tS.bodyText2?.apply(color: Colors.black, fontWeightDelta: 2)),
                  ),
                  const VerticalDivider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text('Accept Invite', style: tS.bodyText2?.apply(color: Colors.black, fontWeightDelta: 2)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appHeader(TextTheme tS) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/me.jpg',
                fit: BoxFit.cover,
                height: 35,
                width: 35,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello there', style: tS.caption),
                  Text(
                    'Batara Kanaydo',
                    style: tS.subtitle1?.apply(fontWeightDelta: 2),
                  )
                ],
              ),
            ),
          ),
          const Icon(
            Icons.notifications_on_rounded,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
