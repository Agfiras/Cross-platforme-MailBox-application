import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<show> showUser() async {
//   var url = "http://192.168.1.111/ViewUsername.php";
//   final response = await http.get(Uri.parse(url));
//   return show.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
// }
Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('http://192.168.8.106/ViewUsername.php'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String email;

  const Album({
    required this.email,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      email: json['email'],
    );
  }
}

void main() {
  runApp(const Account());
}

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => AccountState();
}

class AccountState extends State<Account> {
  bool isChecked = false;
  bool isChecked1 = false;

  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      //check box color
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.purple;
      }
      return Colors.purple;
    }

    //
    return Scaffold(
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
        title: Text(
          'Account',
          style: GoogleFonts.urbanist(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          onPressed: (() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          }),
          icon: const Icon(Icons.arrow_back_outlined),
          color: Colors.white,
        ),
      ),
      body: Stack(children: <Widget>[
        Container(
          alignment: const Alignment(0, -0.8),
          child: Container(
            width: 350,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment(0, -0.8),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/cyborg.png'),
              )),
            )),

        //Show email from database
        Align(
          alignment: const Alignment(-0.7, -0.3),
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data!.email,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),

        Align(
            alignment: const Alignment(-0.77, -0.4),
            child: Text(
              'Email :',
              style: GoogleFonts.hind(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            )),
        //CheckBox
        Align(
          alignment: const Alignment(-0.85, -0.1),
          child: Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              }),
        ),
        Align(
            alignment: const Alignment(-0.47, -0.1),
            child: Text(
              'Push Notification',
              style: GoogleFonts.urbanist(
                fontSize: 18,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            )),
        //email checkbox
        Align(
          alignment: const Alignment(-0.85, 0),
          child: Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked1,
              onChanged: (bool? value) {
                setState(() {
                  isChecked1 = value!;
                });
              }),
        ),
        Align(
            alignment: const Alignment(-0.35, 0),
            child: Text(
              'Push Email notification',
              style: GoogleFonts.urbanist(
                fontSize: 18,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            )),
      ]),
    );
  }
}
