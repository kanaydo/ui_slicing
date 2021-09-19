import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_slicing/mountain_tracking/home_page.dart';

void main() {
  runApp(const MountainTrackingApp());
}

class MountainTrackingApp extends StatelessWidget {
  const MountainTrackingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: const MountainTrackingHomeView(),
    );
  }
}
