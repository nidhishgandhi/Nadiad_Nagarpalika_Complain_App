import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nadiyad_nagarpalika_complain_app/utils/Colors.dart';

class SanitizationAdmin extends StatefulWidget {
  @override
  _SanitizationAdminState createState() => _SanitizationAdminState();
}

class _SanitizationAdminState extends State<SanitizationAdmin> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('SanitizationAdmin');
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeLightColors,
        title: Text(" All Sanitization Complains"),
      ),
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var doc = snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: LinearGradient(
                            colors: [myContainer, myContainer],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 7,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Name: " + doc["name"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.w700),
                              textScaleFactor: 1.1,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Area: " + doc["area"],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Avenir',
                                      fontWeight: FontWeight.w700),
                                ),
                                Text("Date: " + doc["date"],
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.w700)),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                          trailing: Image.network(
                            doc['img'],
                            height: 100,
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return Theme(
                                    data: Theme.of(context).copyWith(
                                        dialogBackgroundColor: Colors.white),
                                    child: Dialog(
                                      backgroundColor: dialougeColor,
                                      insetPadding: EdgeInsets.all(15),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          child: ListView(
                                            children: <Widget>[
                                              InkWell(
                                                child: Container(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Icon(
                                                      Icons.cancel,
                                                      size: 30,
                                                    )),
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      child: Text("Name: ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  Text(
                                                    snapshot.data.docs[index]
                                                        ["name"],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Avenir',
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      child: Text("Date: ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  Text(
                                                    snapshot.data.docs[index]
                                                        ["date"],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Avenir',
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      child: Text("Pincode: ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  Text(
                                                    snapshot.data.docs[index]
                                                        ["pin"],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Avenir',
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      child: Text("Mobile No: ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  Text(
                                                    snapshot.data.docs[index]
                                                        ["mob"],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Avenir',
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  child: Text("SubCategory: ",
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              Text(
                                                snapshot.data.docs[index]
                                                    ["subcategory"],
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Avenir',
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Container(
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  child: Text("Address: ",
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              Text(
                                                snapshot.data.docs[index]
                                                    ["address"],
                                                maxLines: 5,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Avenir',
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Container(
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      child: Text("Area: ",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                  Text(
                                                    snapshot.data.docs[index]
                                                        ["area"],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                  child: Text("Description: ",
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              Text(
                                                snapshot.data.docs[index]
                                                    ["description"],
                                                maxLines: 5,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Avenir',
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Container(
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 10,
                                                ),
                                              )
                                              // _buildTextField(
                                              //   "Name : " +
                                              //       snapshot.data.docs[index]
                                              //           ["name"],
                                              // ),
                                              // _buildTextField(
                                              //   "Date : " +
                                              //       snapshot.data.docs[index]
                                              //           ["date"],
                                              // ),
                                              // _buildTextField(
                                              //   "Pincode : " +
                                              //       snapshot.data.docs[index]
                                              //           ["pin"],
                                              // ),
                                              // _buildTextField(
                                              //   "Mobile : " +
                                              //       snapshot.data.docs[index]
                                              //           ["mob"],
                                              // ),
                                              // _buildTextField(
                                              //   "subcategory : " +
                                              //       snapshot.data.docs[index]
                                              //           ["subcategory"],
                                              // ),
                                              // _buildTextField(
                                              //   "Address : " +
                                              //       snapshot.data.docs[index]
                                              //           ["address"],
                                              // ),
                                              // _buildTextField(
                                              //   "Area : " +
                                              //       snapshot.data.docs[index]
                                              //           ["area"],
                                              // ),
                                              // _buildTextField("Description : " +
                                              //     snapshot.data.docs[index]
                                              //         ["description"]),
                                              ,
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Image.network(
                                                snapshot.data.docs[index]
                                                    ["img"],
                                                width: 400,
                                                height: 300,
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.delete_forever,
                                                  color: Colors.redAccent,
                                                  size: 40,
                                                ),
                                                onPressed: () {
                                                  return showDialog<void>(
                                                    context: context,
                                                    barrierDismissible:
                                                        false, // user must tap button!
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Delete Complain'),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: <Widget>[
                                                              Text(
                                                                  'Delete Complain.'),
                                                              Text(
                                                                  'Are you sure to delete this complain permanently ?'),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child:
                                                                Text('Confirm'),
                                                            onPressed: () {
                                                              //flag = true;
                                                              Map<String,
                                                                      dynamic>
                                                                  data = {
                                                                'name': snapshot
                                                                        .data
                                                                        .docs[
                                                                    index]["name"],
                                                                'mob': snapshot
                                                                        .data
                                                                        .docs[
                                                                    index]["mob"],
                                                                'pin': snapshot
                                                                        .data
                                                                        .docs[
                                                                    index]["pin"],
                                                                'address': snapshot
                                                                            .data
                                                                            .docs[
                                                                        index]
                                                                    ["address"],
                                                                'img': snapshot
                                                                        .data
                                                                        .docs[
                                                                    index]["img"],
                                                                'date': snapshot
                                                                        .data
                                                                        .docs[
                                                                    index]["date"],
                                                                'subcategory': snapshot
                                                                            .data
                                                                            .docs[
                                                                        index][
                                                                    "subcategory"],
                                                                'area': snapshot
                                                                        .data
                                                                        .docs[
                                                                    index]["area"],
                                                                'description': snapshot
                                                                            .data
                                                                            .docs[
                                                                        index][
                                                                    "description"]
                                                              };
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      "Solved")
                                                                  .add(data);

                                                              snapshot
                                                                  .data
                                                                  .docs[index]
                                                                  .reference
                                                                  .delete();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              print(
                                                                  'Confirmed');
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            child:
                                                                Text('Cancel'),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                            );
                          },
                        ),
                      ),
                    );
                  });
            } else {
              return Text("no complain");
            }
          }),
    );
  }
}
