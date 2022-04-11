import 'package:flutter/material.dart';

void main() {
  runApp(const Account());
}

class Account extends StatefulWidget {
  const Account({ Key? key }) : super(key: key);

  @override
  State<Account> createState() => AccountState();
}

class AccountState extends State<Account> {
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
        title: const Text('Account',style: TextStyle(color: Colors.white),),
        leading: const Icon(Icons.arrow_back_outlined,color: Colors.white,),
      ),
    );
  }
}