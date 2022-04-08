import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home> {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("All Maills");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(5, 5),
          child: Container(),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        )),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: cusSearchBar,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(textInputAction: TextInputAction.go,
                  decoration: InputDecoration(border: InputBorder.none ),
                  style: TextStyle(color: Colors.white,fontSize: 16.0),);
                }
                else{
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text("All Maills");
                }
              });
            },
            icon: cusIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_3),
          )
        ],
      ),
    );
  }
}
