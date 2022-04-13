import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<show> showUser() async {
  var url = "http://192.168.1.111/ViewUsername.php";
  var response = await http.get(Uri.parse(url));
  return show.fromJson(jsonDecode(response.body));
}

class show {
  final String username;
  show({required this.username});
  
  factory show.fromJson(Map<String, dynamic> json) {
    return show(
      username: json['username'],
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
  late Future<show> futureshow;

  @override
  void initState() {
    super.initState();
    futureshow = showUser();
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.white),
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
        Align(
          alignment: Alignment(0, -0.10),
          child: FutureBuilder<show>(
            future: futureshow,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.username);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // spinner
              return CircularProgressIndicator();
            },
          ),
        )
      ]),
    );
  }
}
