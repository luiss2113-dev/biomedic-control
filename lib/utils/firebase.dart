import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseImpl {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //https://firebase.google.com/docs/firestore/quickstart?hl=es&authuser=0#dart
  FirebaseFirestore firestore = FirebaseFirestore.instance;
}
