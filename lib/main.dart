import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defesa_civil_agora_vai/banco/banco.dart';
import 'package:defesa_civil_agora_vai/view/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
  Firebase.initializeApp();
  Banco banco = new Banco();
  // Firestore.instance.collection("usuarios").getDocuments().then((value) => {
  //       value.documents.forEach((element) {
  //         print(element.data);
  //       })
  //     });
  // Firestore.instance.collection("usuarios")
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Login_page(),
    );
  }
}
