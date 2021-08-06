import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:nadiyad_nagarpalika_complain_app/complainfiles/complainelectric.dart';
import 'package:nadiyad_nagarpalika_complain_app/complainfiles/complaindrainage.dart';
import 'package:nadiyad_nagarpalika_complain_app/complainfiles/complainsanitize.dart';
import 'package:nadiyad_nagarpalika_complain_app/complainfiles/complainwater.dart';
import 'package:nadiyad_nagarpalika_complain_app/complainfiles/complainroad.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nadiyad_nagarpalika_complain_app/utils/Colors.dart';

import 'NavigationDrawer.dart';

class Complains extends StatefulWidget {
  @override
  _ComplainsState createState() => _ComplainsState();
}

class _ComplainsState extends State<Complains> {
  final double _borderRadius = 24;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  var items = [
    PlaceInfo("assets/images/water.JPG", 'Water Problems', Color(0xff6DC8F3),
        Color(0xff73A1F9)),
    PlaceInfo("assets/images/electricity.JPG", 'Electricity Problems',
        Color(0xffFFB157), Color(0xffFFA057)),
    PlaceInfo("assets/images/drainage.JPG", 'Drainage Problems',
        Color(0xffFF5B95), Color(0xffF8556D)),
    PlaceInfo("assets/images/road.JPG", 'Road Problems', Color(0xffD76EF5),
        Color(0xff8F7AFE)),
    PlaceInfo("assets/images/sanitize.JPG", 'Sanitization Problems',
        Color(0xff42E695), Color(0xff3BB2B8)),
  ];

  @override
  Widget build(BuildContext context) {
    //List<Item> mylist = [item1, item2, item3, item4, item5];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeLightColors,
        title: Text("Your Complains"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Ink(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      gradient: LinearGradient(colors: [
                        items[index].startColor,
                        items[index].endColor
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: items[index].endColor,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        if (items[index].name == "Water Problems") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewComplainsWater()));
                        } else if (items[index].name ==
                            "Electricity Problems") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ViewComplainsElectric()));
                        } else if (items[index].name == "Drainage Problems") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ViewComplainsDrainage()));
                        } else if (items[index].name == "Road Problems") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewComplainsRoad()));
                        } else if (items[index].name ==
                            "Sanitization Problems") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ViewComplainsSanitize()));
                        }
                      },
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: CustomPaint(
                      size: Size(100, 150),
                      painter: CustomCardShapePainter(_borderRadius,
                          items[index].startColor, items[index].endColor),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            items[index].img,
                            height: 60,
                            width: 60,
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                items[index].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Avenir',
                                  fontWeight: FontWeight.w700,
                                ),
                                textScaleFactor: 1.1,
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      drawer: navigationDrawer(),
    );
  }
}

class PlaceInfo {
  final String img;
  final String name;

  final Color startColor;
  final Color endColor;

  PlaceInfo(this.img, this.name, this.startColor, this.endColor);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
