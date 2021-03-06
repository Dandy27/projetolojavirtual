


import 'package:cloud_firestore/cloud_firestore.dart';

class User {
User({this.email, this.password, this.name, this.confirmPassword, this.id});

  String id;
  String email;
  String password;
  String name;

  String confirmPassword;

  DocumentReference get firestoreRef =>
  Firestore.instance.document('users/$id');


  Future<void> saveData()async{
   await  firestoreRef.setData(toMap());
  }

  Map<String, dynamic> toMap(){
return {
  'name': name,
  'email': email,
};
  }

}