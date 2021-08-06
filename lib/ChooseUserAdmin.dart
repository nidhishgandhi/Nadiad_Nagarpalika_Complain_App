import 'package:flutter/material.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/LoginAdmin.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/HomePage.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/SignUpScreen.dart';
import 'package:nadiyad_nagarpalika_complain_app/utils/Colors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'Admin/signup.dart';

class ChooseUserAdmin extends StatelessWidget {
  final userdata = GetStorage();
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
            backgroundColor: Colors.orange[50],
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: orangeLightColors,
              title: Text("Your Profile"),
            ),
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: orangeColors,
                  child: Container(
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            height: 170.0,
                            width: 170.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/AdminLogo.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginAdmin()),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Admin",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: orangeColors,
                  child: Container(
                    child: Column(
                      children: [
                        InkWell(
                          child: Container(
                            height: 170.0,
                            width: 170.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/UserLogo.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("User",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ))));
  }
}
