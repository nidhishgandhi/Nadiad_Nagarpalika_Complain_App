import 'package:nadiyad_nagarpalika_complain_app/screens/drainage.dart';
import 'package:nadiyad_nagarpalika_complain_app/screens/electricity.dart';
import 'package:nadiyad_nagarpalika_complain_app/screens/road.dart';
import 'package:nadiyad_nagarpalika_complain_app/screens/sanitize.dart';
import 'package:nadiyad_nagarpalika_complain_app/screens/water.dart';
import 'package:flutter/material.dart';
import 'package:nadiyad_nagarpalika_complain_app/utils/Colors.dart';

class GridViewBoard extends StatelessWidget {
  Item item1 = new Item(title: "Water", img: "assets/images/water.JPG");
  Item item2 =
      new Item(title: "Electricity", img: "assets/images/electricity.JPG");
  Item item3 = new Item(title: "Drainage", img: "assets/images/drainage.JPG");
  Item item4 = new Item(title: "Road", img: "assets/images/road.JPG");
  Item item5 =
      new Item(title: "Sanitization", img: "assets/images/sanitize.JPG");
  @override
  Widget build(BuildContext context) {
    List<Item> mylist = [item1, item2, item3, item4, item5];
    var color = orangeColors;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
          children: mylist.map((data) {
            return Material(
              child: Ink(
                decoration: BoxDecoration(
                  color: orangeColors,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    if (data.title == "Water") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Water()));
                    } else if (data.title == "Electricity") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Electricity()));
                    } else if (data.title == "Drainage") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Drainage()));
                    } else if (data.title == "Road") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Road()));
                    } else if (data.title == "Sanitization") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sanitization()));
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        data.img,
                        width: 90,
                        height: 90,
                      ),
                      SizedBox(height: 14),
                      Text(
                        data.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Item {
  String title;
  String img;

  Item({this.title, this.img});
}
