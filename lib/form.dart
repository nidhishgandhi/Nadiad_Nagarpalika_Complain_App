// import 'package:flutter/material.dart';
// import 'package:nadiyad_nagarpalika_complain_app/Profile.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProfileForm extends StatefulWidget {
//   @override
//   _ProfileFormState createState() => _ProfileFormState();
// }

// class _ProfileFormState extends State<ProfileForm> {
//   TextEditingController name = new TextEditingController();
//   TextEditingController mob = new TextEditingController();
//   TextEditingController pin = new TextEditingController();
//   TextEditingController address = new TextEditingController();
//   // String name = "";
//   // String mob = "";
//   // String email = "";
//   // String pin = "";
//   // String address = "";

//   // final fb = FirebaseDatabase.instance;
//   // final FirebaseAuth _auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     //final ref = fb.reference().child("Profile");
//     return Material(
//       child: Form(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 100,
//             ),
//             Text("Profile",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//             SizedBox(
//               height: 100,
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: name,
//                     // onChanged: (val) {
//                     //   name = val;
//                     // },
//                     decoration:
//                         InputDecoration(hintText: "Name", labelText: "Name"),
//                   ),
//                   TextFormField(
//                     controller: mob,
//                     // onChanged: (val) {
//                     //   mob = val;
//                     // },
//                     decoration: InputDecoration(
//                         hintText: "Mobile No.", labelText: "Mobile No."),
//                   ),
//                   TextFormField(
//                     controller: pin,
//                     // onChanged: (val) {
//                     //   pin = val;
//                     // },
//                     decoration: InputDecoration(
//                         hintText: "Pincode", labelText: "Pincode"),
//                   ),
//                   TextFormField(
//                     controller: address,
//                     // onChanged: (val) {
//                     //   address = val;
//                     // },
//                     decoration: InputDecoration(
//                         hintText: "Address", labelText: "Address"),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   ElevatedButton(
//                       child: Text('Submit'),
//                       onPressed: () {
//                         // User user = FirebaseAuth.instance.currentUser;
//                         // ref.child(user.uid).set({
//                         //   "name": name,
//                         //   "mob": mob,
//                         //   "pin": pin,
//                         //   "address": address
//                         // });
//                         Map<String, dynamic> data = {
//                           "name": name.text,
//                           "mob": mob.text,
//                           "pincode": pin.text,
//                           "address": address.text
//                         };
//                         FirebaseFirestore.instance
//                             .collection("Profile")
//                             .add(data);
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Profile()),
//                         );
//                       }),
//                   SizedBox(
//                     height: 50,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

