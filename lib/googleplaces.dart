import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GooglePlacesAPIScreen extends StatefulWidget {
  const GooglePlacesAPIScreen({super.key});

  @override
  State<GooglePlacesAPIScreen> createState() => _GooglePlacesAPIScreenState();
}

class _GooglePlacesAPIScreenState extends State<GooglePlacesAPIScreen> {
  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String sessionToken = '12345';

  @override
  void initState() {
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Search places with name'),
          )
        ],
      ),
    ));
  }
}
