import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserCurrentLocationScreenState extends StatefulWidget {
  const GetUserCurrentLocationScreenState({super.key});

  @override
  State<GetUserCurrentLocationScreenState> createState() =>
      _GetUserCurrentLocationScreenStateState();
}

class _GetUserCurrentLocationScreenStateState
    extends State<GetUserCurrentLocationScreenState> {
  final Completer<GoogleMapController> _controller = Completer();

  // CameraPosition?

  final _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  List<Marker> _marker = [];
  List<Marker> list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(37.42796133580664, -122.085749655962),
        infoWindow: InfoWindow(title: 'My current location')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(33.627121, 73.093628),
        infoWindow: InfoWindow(title: 'My current location')),
  ];
  loadData() async {
    getUserCurrentLocation().then((value) {
      print('My Current Location');
      print(value.latitude.toString() + '' + value.longitude.toString());
    });

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(35.6762, 139.6503), zoom: 14),
    ));
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error);
    });
    return Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(list);
    loadData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          myLocationEnabled: true,
          compassEnabled: true,
          markers: Set<Marker>.of(list),
          onMapCreated: (GoogleMapController controller) =>
              _controller.complete(controller),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: Icon(Icons.local_activity),
        // child: Icon(Icons.location_disabled_outlined),
        // onPressed: () async {

        //   setState(() {});
        // },
      ),
    );
  }
}
