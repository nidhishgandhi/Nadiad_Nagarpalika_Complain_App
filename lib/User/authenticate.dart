import 'package:flutter/material.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/Loginscreen.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/SignUpScreen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login();
    } else {
      return SignUp();
    }
  }
}
