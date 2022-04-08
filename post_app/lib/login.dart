// ignore_for_file: deprecated_member_use, must_be_immutable, unnecessary_string_escapes
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:post_app/Dashboard.dart';
import 'dart:convert';
void main() => runApp( LoginScreen());

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  Future login(BuildContext context) async {
    if (email.text == "" || password.text == "") {
      Fluttertoast.showToast(
        msg: "Both fields cannot be blank",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
      }
      else {
      var url = "http://192.168.1.111/post_app/login.php";
      var response = await http.post(Uri.parse(url), body: {
        "email": email.text,
        "password": password.text,
      });
      print(response.body);
      var data = json.decode(response.body);
      print(data);
      if (data == "Success") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DashBoard()));
      } else {
        Fluttertoast.showToast(
          msg: "The email and password combination does not exist!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          children: <Widget>[
          Pinned.fromPins(
            Pin(size: 243.0, end: 0.0),
            Pin(size: 195.0, start: 61.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/undraw_Mailbox_re_dvds.png'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.25), BlendMode.dstIn),
                ),
              ),
            )),
          
            Pinned.fromPins(
              Pin(size: 80.0, start: 24.0),
              Pin(size: 90.0, middle: 0.1792),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 30,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w700,
                ),
                softWrap: false,
              ),
            ),

            
            // const SizedBox(
            //   height: 30.0,
            // ),
           Pinned.fromPins(
              Pin(size: 350.0, start: 23.0),
              Pin(size: 90.0, middle: 0.45),
            child:TextField(
              keyboardType: TextInputType.emailAddress,
              controller: email,
              obscureText: false,
              decoration:  InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(35.10),
                    borderSide: const BorderSide(width: 1.1, color: Color.fromARGB(255, 0, 0, 0)
                    ),
                  ),
                  prefixIcon: const Icon(Icons.email),
                  hintText: "Email",
                  labelStyle: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Futura Bk BT',
                      color: Color(0xff707070)),
                  fillColor: const Color.fromARGB(31, 255, 255, 255),
                  filled: true),
            ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Pinned.fromPins(
              Pin(size: 350.0, start: 23.0),
              Pin(size: 90.0, middle: 0.56),
            child:TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(35.10),
                    borderSide: const BorderSide(width: 1.1, color: Color.fromARGB(255, 0, 0, 0)
                    ),
                  ),
                  prefixIcon: const Icon(Icons.password),
                  hintText: "Password",
                  labelStyle: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Futura Bk BT',
                      color: Color(0xff707070)),
                  fillColor: Color.fromARGB(31, 255, 255, 255),
                  filled: true),
            ),
            ),
            Pinned.fromPins(
              Pin(size: 310.0, start: 45.0),
              Pin(size: 50.0, middle: 0.63),
            child:ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    login(context);
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        fontFamily: 'Urbane',
                        fontSize: 23,
                        color: Colors.white),
                  ),
                  color: const Color(0xffffd500),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ))
            ),
            ],
        ));
  }
}
