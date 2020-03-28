import 'package:chat/chatScreen/chatScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Login/login_page.dart';

void main() async {
  
  runApp(MyApp());
  Firestore.instance.collection("mensagnes").document().setData({
      "text":"Olá",
      "from":"nascimento",
      "read": false
    });
  
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.blue
        )
      ),
      home: LoginPage(),
    );
  }

 
}