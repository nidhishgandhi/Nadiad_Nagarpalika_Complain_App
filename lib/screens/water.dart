import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nadiyad_nagarpalika_complain_app/User/Profile.dart';
import 'package:nadiyad_nagarpalika_complain_app/utils/Colors.dart';
import 'package:nadiyad_nagarpalika_complain_app/utils/loading.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

//import '../Notification.dart';

class Water extends StatefulWidget {
  String myName;
  String myMob;
  String myPin;
  String myAddress;
  //Water(this.myName, this.myMob, this.myPin, this.myAddress);
  @override
  _WaterState createState() => _WaterState();
}

class _WaterState extends State<Water> {
  String myName;
  String myMob;
  String myPin;
  String myAddress;
  File image;
  String imgUrl;
  String imgUrl1;
  TextEditingController area = TextEditingController();
  TextEditingController description = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //bool _autovalidate = false;

  var firebaseUser = FirebaseAuth.instance.currentUser;

  CollectionReference ref = FirebaseFirestore.instance.collection('Water');

  String valuechoose;

  // List listitems = [
  //   "Water is irregular",
  //   "Dusted water",
  //   "Leakage in main pipeline",
  //   "Water connection not given",
  //   "Water logged due to rain",
  //   "Others"
  // ];

  FlutterLocalNotificationsPlugin localNotification;

  Future<String> sendData() async {
    String filemame = basename(image.path);
    Reference storageImage = FirebaseStorage.instance.ref().child(filemame);
    UploadTask task = storageImage.putFile(image);
    imgUrl = await (await task).ref.getDownloadURL();
    return imgUrl;
  }

  Future getImage() async {
    var img = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      image = File(img.path);
    });
  }

  @override
  void initState() {
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('myicon');
    var iOSinitilize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iOSinitilize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

  Future showNotificattion() async {
    var androidDetails = new AndroidNotificationDetails(
        "channelId", "Local Notification", "anything",
        importance: Importance.max);
    bool loading = false;

    var iSODetails = new IOSNotificationDetails();
    var generalNotificationdetails =
        new NotificationDetails(android: androidDetails, iOS: iSODetails);
    await localNotification.show(
        0,
        "Thank You for registering complain!",
        "Your Water Complain has been successfully registered. ",
        generalNotificationdetails);
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeLightColors,
        title: Text('Water Complain Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: DropdownButtonFormField<String>(
                  value: valuechoose,
                  isExpanded: true,
                  hint: Text(
                    'Select SubItem',
                  ),
                  onChanged: (newValue) =>
                      setState(() => valuechoose = newValue),
                  validator: (value) => value == null ? 'field required' : null,
                  // onChanged: (newValue) => setState(() {
                  //   valuechoose = newValue;
                  // }),
                  items: [
                    "Water is irregular",
                    "Dusted water",
                    "Leakage in main pipeline",
                    "Water connection not given",
                    "Water logged due to rain",
                    "Others"
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Today's Date",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  enabled: false,
                  readOnly: true,
                  initialValue: DateFormat.yMMMd().format(now),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: area,
                decoration: InputDecoration(
                    hintText: 'Enter area',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0))),
                validator: (val) => val.isEmpty ? 'please enter Area' : null,
                onChanged: (value) => setState(() {
                  area = value as TextEditingController;
                }),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: description,
                decoration: InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0))),
                validator: (val) =>
                    val.isEmpty ? 'please enter description' : null,
                onChanged: (value) => setState(() {
                  description = value as TextEditingController;
                }),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  height: 150,
                  width: 400,
                  child: image != null
                      ? Image.file(image)
                      : Center(child: Text("No Image is picked !!")),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () => getImage(),
                  child: Icon(Icons.add_a_photo, size: 40),
                ),
              ),
              FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 65),
                  color: orangeColors,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(32.0)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      imgUrl1 = await sendData();
                      final firebaseUser = FirebaseAuth.instance.currentUser;
                      if (firebaseUser != null)
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(firebaseUser.uid)
                            .get()
                            .then((ds) {
                          myName = ds.data()['name'];
                          myMob = ds.data()['mob'];
                          myPin = ds.data()['pin'];
                          myAddress = ds.data()['address'];

                          print(myName);
                        });
                      ref
                          .doc(firebaseUser.uid)
                          .collection(('Multiple Problems'))
                          .add({
                        'img': imgUrl1,
                        'date': DateFormat.yMMMd().format(now),
                        'subcategory': valuechoose,
                        'area': area.text,
                        'description': description.text
                      });
                      Map<String, dynamic> data = {
                        'name': myName,
                        'mob': myMob,
                        'pin': myPin,
                        'address': myAddress,
                        'img': imgUrl1,
                        'date': DateFormat.yMMMd().format(now),
                        'subcategory': valuechoose,
                        'area': area.text,
                        'description': description.text
                      };
                      FirebaseFirestore.instance
                          .collection("waterAdmin")
                          .add(data);
                      showNotificattion();
                      setState(() {
                        Loading();
                      });
                      Navigator.pop(context);
                      Fluttertoast.showToast(msg: "successfully submitted");
                    } else if (image == null) {
                      Fluttertoast.showToast(msg: "provide image");
                    } else {
                      Fluttertoast.showToast(msg: "Enter all details");
                    }
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(fontSize: 18.0),
                  )),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
