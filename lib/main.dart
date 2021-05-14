// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'sreens/base/base_screen.dart';

void main() async {
  runApp(MyApp());

 }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RR BEBIDAS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: const Color.fromARGB(255, 4, 125, 151),
        scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 151),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        )
      ),
      home: BaseScreen(),
    );
  }
}
