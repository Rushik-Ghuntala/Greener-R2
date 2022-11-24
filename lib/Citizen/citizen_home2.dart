import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Citizen_Home1 extends StatefulWidget {
  const Citizen_Home1({Key? key}) : super(key: key);

  @override
  State<Citizen_Home1> createState() => _Citizen_Home1State();
}

class _Citizen_Home1State extends State<Citizen_Home1> {
  @override
  Widget build(BuildContext context) {
    var countTree = 98753;
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Greener',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: BoxDecoration(
          color: Colors.green[300],
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 0),
            ),
          ],
        ),
        height: height * 0.25,
        width: width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Center(
                child: Text(
                  '$countTree',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Center(
                child: Text(
                  'Total Tree\'s Planted',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
          backgroundColor: Colors.green,
          color: Colors.white,
          activeColor: Colors.green,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 4,
          padding: EdgeInsets.all(16),
          tabs: const [
        GButton(
          icon: Icons.home,
        ),
        GButton(
          icon: Icons.park,
        ),
        GButton(
          icon: Icons.qr_code_2,
        ),
        GButton(
          icon: Icons.yard_outlined,
        ),
        GButton(
          icon: Icons.account_circle_rounded,
        ),
      ]),
    );
  }
}