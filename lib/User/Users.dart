import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/HomePage.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/Profile.dart';

class UserManagement {
  storeNewUser(context, name, mob, pin, address) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .set({'name': name, 'mob': mob, 'pin': pin, 'address': address})
        .then((value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false))
        .catchError((e) {
          print(e);
        });
  }
}

class UserManagementUpdate {
  updateNewUser(context, name, mob, pin, address) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .update({'name': name, 'mob': mob, 'pin': pin, 'address': address})
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile())))
        .catchError((e) {
          print(e);
        });
  }
}
