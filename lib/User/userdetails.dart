import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/Loginscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:nadiyad_nagarpalika_complain_app/User/Users.dart';
import 'package:nadiyad_nagarpalika_complain_app/utils/Colors.dart';

import 'package:nadiyad_nagarpalika_complain_app/widgets/ButtonWidget.dart';
import 'package:nadiyad_nagarpalika_complain_app/widgets/HeaderContainer.dart';

class Userdetails extends StatefulWidget {
  @override
  _UserdetailsState createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  String _name;
  String _mob;
  String _pin;
  String _address;
  final _formKey = GlobalKey<FormState>();

  void validate() {
    if (_formKey.currentState.validate()) {
      UserManagement().storeNewUser(context, _name, _mob, _pin, _address);
      Fluttertoast.showToast(msg: "successfully submitted");
    } else {
      Fluttertoast.showToast(msg: "Enter all details");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeLightColors,
        title: Text('Enter all details'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            children: <Widget>[
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Name",
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'please enter name' : null,
                          onChanged: (value) => setState(() {
                            _name = value;
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Mobile Number",
                            prefixIcon: Icon(Icons.call),
                          ),
                          validator: (val) =>
                              val.length != 10 ? 'Enter 10 digit number' : null,
                          onChanged: (value) => setState(() {
                            _mob = value;
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pincode",
                            prefixIcon: Icon(Icons.pin),
                          ),
                          validator: (val) =>
                              val.length != 6 ? 'Enter Valid Pincode' : null,
                          onChanged: (value) => setState(() {
                            _pin = value;
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
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Address",
                            prefixIcon: Icon(Icons.house),
                          ),
                          validator: (val) =>
                              val.length < 30 ? 'Enter Valid Address' : null,
                          onChanged: (value) => setState(() {
                            _address = value;
                          }),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: ButtonWidget(
                            btnText: "SUBMIT",
                            onClick: () {
                              validate();
                            },
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
