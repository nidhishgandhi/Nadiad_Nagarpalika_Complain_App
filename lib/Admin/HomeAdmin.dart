import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/GridAdmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/LoginAdmin.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/Solved.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/Unsolved.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/addadmin.dart';
import 'package:nadiyad_nagarpalika_complain_app/ChooseUserAdmin.dart';
import 'package:nadiyad_nagarpalika_complain_app/utils/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  int currentindex = 0;
  List pages = [Unsolved(), Addadmin(), Solved()];
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  //return true when click on "Yes"
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
        onWillPop: showExitPopup, //call function on back button press
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: orangeLightColors,
            title: Text("Complain App"),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.remove('adminemail');
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseUserAdmin()));
                },
              ),
            ],
          ),
          // body: Column(
          //   children: [SizedBox(height: 30), GridAdmin()],
          // ),
          body: pages[currentindex],
          bottomNavigationBar: BottomNavyBar(
            showElevation: true,

            //type:BottomNavigationBarType.fixed,
            selectedIndex: currentindex,
            onItemSelected: (index) {
              setState(() {
                currentindex = index;
                // type:BottomNavigationBarType.fixed;
              });
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Colors.orangeAccent,
                inactiveColor: Colors.black,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.add),
                title: Text('Admin'),
                activeColor: Colors.blueAccent,
                inactiveColor: Colors.black,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.done_outlined),
                title: Text('Solved'),
                activeColor: Colors.green,
                inactiveColor: Colors.black,
              ),
            ],
          ),
        ));
  }
}
