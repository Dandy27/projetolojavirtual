

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'sreens/base/base_screen.dart';

void main() async {
  runApp(MyApp());
  // Firestore.instance.collection('usuarios')
  //     .document('P6w5uzNG4lPjKyjrNXSq')
  //     .snapshots().listen((document) {
  //       print(document.data);
  //
  // });

  // QuerySnapshot snapshot =
  //     await Firestore.instance.collection('boletos').getDocuments();
  // print(snapshot.documents);
  // for(DocumentSnapshot document in snapshot.documents)  print(document.data);

  Firestore.instance.collection('boletos').snapshots().listen((snapshot) {
    for(DocumentSnapshot document in snapshot.documents){
      print(document.data);

    }
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RR BEBIDAS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BaseScreen(),
    );
  }
}
