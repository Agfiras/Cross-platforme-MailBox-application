import 'package:flutter/material.dart';
import 'package:post_app/login.dart';
import 'package:post_app/account.dart';

class NavBar extends StatelessWidget {
  const NavBar({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.purple,
      child: 
      ListView(
        children:[
          const SizedBox(height:20),
          ListTile(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: ((context) => const Account())));},
            leading: const Icon(Icons.account_circle,color: Colors.white,),
            title: const Text('Account',style: TextStyle(fontSize:20.0,color: Colors.white),),
            ),
          const SizedBox(height:530),
          const ListTile(
            leading:Icon(Icons.feedback,color: Colors.white,),
            title: Text('Feedback',style: TextStyle(fontSize: 20.0,color: Colors.white),),),
          ListTile(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginScreen())));},
            leading:const Icon(Icons.logout,color: Colors.red,),
            title: const Text('Log out',style: TextStyle(fontSize: 20.0,color: Colors.red),),)
        ],
      ),
    );
  }
}