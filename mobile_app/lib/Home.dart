import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:post_app/navbar.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

Future<User> fetchuser() async {
  final response =
      await http.get(Uri.parse('http://192.168.8.101/ViewUsername.php'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class User {
  final String username;
  const User({
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
    );
  }
}

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  HomePage createState() => HomePage();
}

late Future<User> futureUser;

class HomePage extends State<Home> {
  @override
  void initState() {
    super.initState();
    futureUser = fetchuser();
  }

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
        Align(
          alignment: const Alignment(-0.2, 0.22),
          child: FutureBuilder<User>(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'To: ${snapshot.data!.username}',
                  style: GoogleFonts.urbanist(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
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
        Align(
          alignment: const Alignment(-0.22, 0.278),
          child: Text(
            DateFormat.MEd().format(DateTime.now()),
            style: GoogleFonts.saira(
              fontSize: 11,
              color: Color(0xffb7b7b7),
              fontWeight: FontWeight.w600,
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
        Align(
          alignment: const Alignment(-0.2, 0.52),
          child: FutureBuilder<User>(
            future: futureUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'To: ${snapshot.data!.username}',
                  style: GoogleFonts.urbanist(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
        //Date of recepetion
        Align(
          alignment: const Alignment(-0.22, 0.58),
          child: Text(
            DateFormat.MEd().format(DateTime.now()),
            style: GoogleFonts.saira(
              fontSize: 11,
              color: Color(0xffb7b7b7),
              fontWeight: FontWeight.w600,
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
