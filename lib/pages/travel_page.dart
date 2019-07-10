import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}
class _TravelPageState extends State <TravelPage> {
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('旅行'),
      ),
      body: Center(
        child: Text('Travel page'),
      ),
    );
  }
}

