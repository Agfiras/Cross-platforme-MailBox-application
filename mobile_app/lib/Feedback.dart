import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(FeedbackHome());
}

class FeedbackHome extends StatefulWidget {
  FeedbackHome({Key? key}) : super(key: key);

  @override
  State<FeedbackHome> createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedbackHome> {
  final objectcontroller = TextEditingController();
  final problemcontroller = TextEditingController();

  bool visible = false;

  Future webcall() async {
    setState(() {
      visible = true;
    });

    String object = objectcontroller.text;
    String problem = problemcontroller.text;

    var url = 'http://192.168.1.4/SubmitFeedback.php';
    var response = await http.post(Uri.parse(url), body: {
      "object": object,
      "problem": problem,
    });
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Your opinion matter"),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Feedback',
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
            height: 420,
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
          alignment: Alignment(0, 1),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                    'assets/undraw_Personal_opinions_re_qw29.png'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.70), BlendMode.dstIn),
              ),
            ),
          ),
        ),
        //Object textfield
        Align(
          alignment: const Alignment(0, -0.85),
          child: SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              controller: objectcontroller,
              obscureText: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.10),
                    borderSide:
                        const BorderSide(width: 1.1, color: Color(0xff707070)),
                  ),
                  prefixIcon: const Icon(Icons.feedback),
                  hintText: "Object",
                  labelStyle:
                      const TextStyle(fontSize: 20, color: Color(0xff707070)),
                  fillColor: const Color.fromARGB(31, 255, 255, 255),
                  filled: true),
            ),
          ),
        ),
        //Problem textfield
        Align(
          alignment: const Alignment(0, -0.5),
          child: SizedBox(
            width: 300,
            height: 250,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 80,
              controller: problemcontroller,
              obscureText: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.10),
                    borderSide:
                        const BorderSide(width: 1.1, color: Color(0xff707070)),
                  ),
                  labelStyle:
                      const TextStyle(fontSize: 20, color: Color(0xff707070)),
                  fillColor: const Color.fromARGB(31, 255, 255, 255),
                  filled: true),
            ),
          ),
        ),
        // submit Button
        Align(
          alignment: const Alignment(0, 0.1),
          child: ButtonTheme(
            minWidth: 200.0,
            height: 40,
            child: RaisedButton(
              onPressed: webcall,
              child: const Text(
                "send",
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
              color: Colors.purple,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
          ),
        ),
        //***/
        Visibility(
            visible: visible,
            child: Container(
                margin: const EdgeInsets.only(bottom: 0),
                child: const CircularProgressIndicator())),
      ]),
    );
  }
}
