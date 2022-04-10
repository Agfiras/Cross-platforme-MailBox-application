import 'package:flutter/material.dart';
import 'package:post_app/login.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  static const String title = 'Login';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: const Color(0xffffffff))),
        home:  LoginScreen(),
      );
}