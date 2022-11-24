import 'package:flutter/material.dart';

import 'login_page.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:note_maker/login_page.dart';

class Welcome_Page extends StatefulWidget {
  const Welcome_Page({Key? key}) : super(key: key);

  @override
  State<Welcome_Page> createState() => _Welcome_PageState();
}

class _Welcome_PageState extends State<Welcome_Page> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green[200],
          child: Column(
            children: [
              Container(
                height: height / 2 - 20,
                width: width,
                color: Colors.green[200],
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image(
                    width: 100,
                    height: 100,
                    image: AssetImage('img/tree_PNG104381.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: height / 2,
                width: width,
                color: Colors.green[200],
                child: Center(
                  child: Text(
                    'Welcome to Greener',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // ClipPath(
              //   clipper: OvalTopBorderClipper(),
              //   child: Column(
              //     children: [
              //       Container(
              //         height: height * 0.06,
              //         width: width,
              //         color: Colors.blue,
              //       ),
              //       Container(
              //         height: height * 0.44,
              //         width: width,
              //         color: Colors.blue,
              //         child: Align(
              //           alignment: Alignment.topCenter,
              //           child: Text(
              //             'Welcome to NoteMaker',
              //             style: TextStyle(
              //                 fontSize: 22,
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.white
              //             ),
              //           ),
              //         ),),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
