// ignore_for_file: deprecated_member_use, must_be_immutable, unnecessary_string_escapes
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:post_app/onboarding.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePagestate();
}

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
  } else {
    var url = "http://192.168.8.106/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
      "password": password.text,
    });
    print(response.body);
    var data = json.decode(response.body);
    print(data);
    if (data == "Success") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const DashBoard()));
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

class HomePagestate extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            Pinned.fromPins(
                Pin(size: 243.0, end: 0.0), Pin(size: 195.0, start: 61.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          const AssetImage('assets/undraw_Mailbox_re_dvds.png'),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.25), BlendMode.dstIn),
                    ),
                  ),
                )),
            Container(
              alignment: const Alignment(-0.8, -0.7),
              child: Text(
                'Login',
                style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
              ),
            ),
            Container(
              alignment: const Alignment(-0.7, -0.56),
              child: Text(
                'Please sign in to continue',
                style: GoogleFonts.hind(
                    textStyle: const TextStyle(
                        color: Color(0xff707070),
                        fontSize: 19,
                        fontWeight: FontWeight.w300)),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              alignment: const Alignment(0.0, -0.15),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                obscureText: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.10),
                      borderSide: const BorderSide(
                          width: 1.1, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    prefixIcon: const Icon(Icons.email),
                    hintText: "Email",
                    labelStyle: GoogleFonts.hind(
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff707070)),
                    fillColor: const Color.fromARGB(31, 255, 255, 255),
                    filled: true),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              alignment: const Alignment(0.0, 0.1),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.10),
                      borderSide: const BorderSide(
                          width: 1.1, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    prefixIcon: const Icon(Icons.key),
                    hintText: "Password",
                    labelStyle: GoogleFonts.hind(
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff707070)),
                    fillColor: const Color.fromARGB(31, 255, 255, 255),
                    filled: true),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              alignment: const Alignment(0.0, 0.3),
              child: ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    login(context);
                  },
                  child: Text(
                    "Submit",
                    style: GoogleFonts.urbanist(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  color: const Color(0xffffd500),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
            ),
            Container(
              alignment: const Alignment(0, 0.8),
              child: Text(
                'Don\'t have an account ?  Please visit',
                style: GoogleFonts.notoSans(
                    fontSize: 14, color: const Color(0xff1c190d)),
                softWrap: false,
              ),
            ),
            Container(
              alignment: const Alignment(0, 0.9),
              child: Link(
                uri: Uri.parse(
                    'https://www.poste.tn/index_service.php?code_menu=9'),
                builder: (context, followLink) => TextButton(
                  child: Text(
                    'www.poste.tn',
                    style: GoogleFonts.notoSans(
                      fontSize: 14,
                      color: const Color(0xff1c190d),
                    ),
                  ),
                  onPressed: () async {
                    const url =
                        'https://www.poste.tn/index_service.php?code_menu=9';
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: false,
                        forceWebView: false,
                        enableJavaScript: false,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
