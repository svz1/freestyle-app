import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Firebaseservices {
    FirebaseAuth _FirebaseAuth=FirebaseAuth.instance ;
    FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
    String getUserId() {
      return FirebaseAuth.instance.currentUser.uid ;
    }
    final CollectionReference productsref=FirebaseFirestore.instance.collection("products") ;

    final CollectionReference usersref=FirebaseFirestore.instance.collection("users") ;
}