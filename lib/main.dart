import 'package:flutter/material.dart';
import 'package:google_maps/convert_LatLong.dart';
import 'package:google_maps/home_screen.dart';

import 'getuserlocation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GetUserCurrentLocationScreenState(),
    );
  }
}
