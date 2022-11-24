import 'auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Welcome_Page.dart';
import 'login_page.dart';
// import 'Citizen/scanner.dart';
// import 'Citizen/abouttree.dart';
// import 'plant.dart';
// import 'Citizen/bottomnav.dart';
// import 'Citizen/homepage.dart';

// Importent note:
// Log out button baki che atle video ma 38 min thi jovu
// https://www.youtube.com/watch?v=V2c04_JWoHA&list=PL3nPgdhXQtHee2I08HTnPJTCJVwMKCUpT
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp({super.key});
  final Future<FirebaseApp> _initilization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initilization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Something went Wrong');
        }
        // Once completed, Shoew your app
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Welcome_Page());
        }
        return CircularProgressIndicator();
      },
    );
  }
}
