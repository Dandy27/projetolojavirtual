// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetolojavirtual/models/user_manager.dart';
import 'package:projetolojavirtual/sreens/signUp/signUp_screen.dart';
import 'package:provider/provider.dart';

import 'sreens/base/base_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
          title: 'RR BEBIDAS',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: const Color.fromARGB(255, 4, 125, 151),
              scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 151),
              appBarTheme: const AppBarTheme(
                elevation: 0,
              )),
          initialRoute: '/base',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/signup':
                return MaterialPageRoute(builder: (_) => SignUpScreen());
              default:
                return MaterialPageRoute(builder: (_) => BaseScreen());
            }
          }),
    );
  }
}
