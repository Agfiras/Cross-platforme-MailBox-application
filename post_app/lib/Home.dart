import 'dart:html';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  Icon cusIcon = Icon(Icons.search);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        )),
        title: const Text(
          'All Maills',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search),),
            IconButton(onPressed: () {},
            icon: Icon(Icons.filter),)
        ],
      ),
    );
  }
}
