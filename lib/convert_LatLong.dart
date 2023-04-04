import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLongToAddress extends StatefulWidget {
  const ConvertLatLongToAddress({super.key});

  @override
  State<ConvertLatLongToAddress> createState() =>
      _ConvertLatLongToAddressState();
}

class _ConvertLatLongToAddressState extends State<ConvertLatLongToAddress> {
  String staddress = '', stcount = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(staddress),
          Text(stcount),
          GestureDetector(
            onTap: () async {
// From a query
              // final query = "1600 Amphiteatre Parkway, Mountain View";
              // var addresses =
              //     await Geocoder.local.findAddressesFromQuery(query);
              // var second = addresses.first;
              // print("${second.featureName} : ${second.coordinates}");
              List<Location> locations =
                  await locationFromAddress("Gronausestraat 710, Enschede");
// From a Coordinates
              // final coordinates = new Coordinates(33.6519, 73.0644);
              // var address = await Geocoder.local
              //     .findAddressesFromCoordinates(coordinates);
              // var first = address.first;
              // print('address:' +
              //     first.featureName.toString() +
              //     first.addressLine.toString());
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(52.2165157, 6.9437819);
              setState(() {
                // staddress = first.addressLine.toString();
                staddress = locations.last.latitude.toString() +
                    '' +
                    locations.last.longitude.toString();
                SizedBox(height: 10);
                stcount = placemarks.reversed.last.country.toString() +
                    '' +
                    placemarks.reversed.last.locality.toString() +
                    '' +
                    placemarks.reversed.last.street.toString();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Center(child: Text('Convert'))),
            ),
          ),
        ],
      ),
    );
  }
}
