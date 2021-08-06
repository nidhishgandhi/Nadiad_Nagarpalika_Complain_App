import 'package:flutter/material.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/GridAdmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/LoginAdmin.dart';
import 'package:nadiyad_nagarpalika_complain_app/utils/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Unsolved extends StatefulWidget {
  @override
  _UnsolvedState createState() => _UnsolvedState();
}

class _UnsolvedState extends State<Unsolved> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: AppBar(
      //   backgroundColor: orangeLightColors,
      //   title: Text("Complain App"),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(
      //         Icons.person_outline,
      //         color: Colors.white,
      //       ),
      //       onPressed: () async {
      //         SharedPreferences pref = await SharedPreferences.getInstance();
      //         pref.remove('email');
      //         FirebaseAuth.instance.signOut();
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => LoginAdmin()));
      //       },
      //     ),
      //   ],
      // ),
      body: Column(
        children: [SizedBox(height: 30), GridAdmin()],
      ),
    );
  }
}
