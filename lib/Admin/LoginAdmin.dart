import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/HomeAdmin.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/Solved.dart';
import 'package:nadiyad_nagarpalika_complain_app/Admin/signup.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/ForgetPassScreen.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/HomePage.dart';
import 'package:nadiyad_nagarpalika_complain_app/utils/Colors.dart';
import 'package:nadiyad_nagarpalika_complain_app/widgets/ButtonWidget.dart';
import 'package:nadiyad_nagarpalika_complain_app/widgets/HeaderContainer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAdmin extends StatefulWidget {
  @override
  _LoginAdminState createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  String _adminemail;
  String _password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            children: <Widget>[
              HeaderContainer("Admin Login"),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter an E-mail' : null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                          ),
                          onChanged: (value) => setState(() {
                            _adminemail = value;
                          }),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            prefixIcon: Icon(Icons.vpn_key),
                          ),
                          onChanged: (value) => setState(() {
                            _password = value;
                          }),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: Text(
                            "Forgot Password?",
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResetPass()),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: ButtonWidget(
                            onClick: () {
                              FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: _adminemail, password: _password)
                                ..then((value) async {
                                  SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                  pref.setString('adminemail', _adminemail);
                                  print("Mansiiiiiiiiiiiiiiiiiiiiiiiiii");
                                  print(pref);
                                })
                                    .then((user) =>
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeAdmin()),
                                            (Route<dynamic> route) => false))
                                    .catchError((e) {
                                  Fluttertoast.showToast(
                                      msg: "Invalid Credential");
                                });
                            },
                            btnText: "LOGIN",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
