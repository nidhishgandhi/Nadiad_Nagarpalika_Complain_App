// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:nadiyad_nagarpalika_complain_app/Admin/LoginAdmin.dart';
// import 'package:nadiyad_nagarpalika_complain_app/User/Loginscreen.dart';
// import 'package:nadiyad_nagarpalika_complain_app/utils/Colors.dart';

// import '../ChooseUserAdmin.dart';

// class SplashPage extends StatefulWidget {
//   @override
//   _SplashPageState createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(milliseconds: 1500), () {
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => LoginAdmin()),
//           (Route<dynamic> route) => false);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [orangeColors, orangeLightColors],
//               end: Alignment.bottomCenter,
//               begin: Alignment.topCenter),
//         ),
//         child: Center(
//           child: Center(
//             child: Text(
//               "Welcome to Nadiyad Nagarpalika Complain App",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 30,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
