import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/navbar.dart';
import 'package:adobe_xd/pinned.dart';

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
  Widget cusSearchBar = Text(
    "All Maills",
    style: GoogleFonts.urbanist(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavBar(),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size(5, 5),
          child: Container(),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
        )),
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: cusSearchBar,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.white)),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                width: 2, color: Colors.white))),
                    style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text("All Maills",
                      style: GoogleFonts.urbanist(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700));
                }
              });
            },
            icon: cusIcon,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt),
          )
        ],
      ),
      body: Stack(children: <Widget>[
        //image Box
        Container(
          alignment: Alignment(0.01, -0.5),
          child: Container(
            width: 131.0,
            height: 221.0,
            color: null,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/taxi.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        // box
        Pinned.fromPins(
          Pin(start: 18.0, end: 17.0),
          Pin(size: 82.0, middle: 0.6534),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        ),
        //Text username
        const Align(
          alignment: Alignment(-0.166, 0.215),
          child: SizedBox(
            width: 113.0,
            height: 16.0,
            child: Text(
              'To : Firas ajengui',
              style: TextStyle(
                fontFamily: 'Urbane',
                fontSize: 13,
                color: Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
        ),
        // image of envolope
        Pinned.fromPins(
          Pin(size: 54.0, start: 27.0),
          Pin(size: 65.0, middle: 0.6532),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cyborg-envelope-7.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        //Date of reception
        const Align(
          alignment: Alignment(-0.221, 0.278),
          child: SizedBox(
            width: 57.0,
            height: 12.0,
            child: Text(
              'Dec 10,2022',
              style: TextStyle(
                fontFamily: 'BR Sonoma W03',
                fontSize: 10,
                color: Color(0xffb7b7b7),
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
            ),
          ),
        ),
        //Box
        Pinned.fromPins(
          Pin(start: 18.0, end: 17.0),
          Pin(size: 82.0, middle: 0.82),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
        ),
        // Text username
        const Align(
          alignment: Alignment(-0.166, 0.5),
          child: SizedBox(
            width: 113.0,
            height: 16.0,
            child: Text(
              'To : Firas ajengui',
              style: TextStyle(
                fontFamily: 'Urbane',
                fontSize: 13,
                color: Color(0xff000000),
              ),
              softWrap: false,
            ),
          ),
        ),
        //Date of recepetion
        const Align(
          alignment: Alignment(-0.221, 0.55),
          child: SizedBox(
            width: 57.0,
            height: 12.0,
            child: Text(
              'Jan 10,2022',
              style: TextStyle(
                fontFamily: 'BR Sonoma W03',
                fontSize: 10,
                color: Color(0xffb7b7b7),
                fontWeight: FontWeight.w600,
              ),
              softWrap: false,
            ),
          ),
        ),
        //image package
        Pinned.fromPins(
          Pin(size: 61.0, start: 27.0),
          Pin(size: 46.0, middle: 0.8),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bloom-yellow-box-package.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
