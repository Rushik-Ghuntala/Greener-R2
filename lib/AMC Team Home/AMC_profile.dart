import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../user.dart';
import 'user_preferences.dart';
import 'appbar_widget.dart';
import '../button_widget.dart';
import 'numbers_widget.dart';
import 'profile_widget.dart';
import '../auth_controller.dart';

class AMC_Profile extends StatefulWidget {
  @override
  _AMC_ProfileState createState() => _AMC_ProfileState();
}

class _AMC_ProfileState extends State<AMC_Profile> {
  String tid = '202003103510123';
  String sdate = '29/11/2022';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        // backgroundColor: Colors.green,
        title: Text(
          "Team Details",
        ),
        actions: [
          Tooltip(
              message: 'Log Out',
              child: IconButton(
                  onPressed: () {
                    AuthController.instance.logout();
                  },
                  icon: Icon(Icons.logout)))
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.lightGreen],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
      ),
      // buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 24),
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          // Center(child: buildUpgradeButton()),
          // const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 24),
          // buildAbout(user),
          // const SizedBox(height: 24),
          Center(
              child: Text(
            "Team Details",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )),
          Team_Leader(user, 'lname', "29/11/2022", 37),
          Team_Member(user, 'Neem', '29/11/2022', 45),
          Team_Member(user, 'Pipal', '15/12/2022', 35),
          Team_Member(user, 'Neem', '14/02/2023', 23),
          // const SizedBox(height: 24),
          // Center(child: logout()),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            'Email : ' + user.email,
            style: TextStyle(color: Colors.green[900]),
          ),
          Text(
            'Team ID : $tid',
            style: TextStyle(color: Colors.green[900]),
          ),
          Text(
            'Started Date : $sdate',
            style: TextStyle(color: Colors.green[900]),
          ),
        ],
      );

  Widget Team_Leader(User user, String lname, String date, int age) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
            ),
          ],
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height * 0.12,
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Container(
                width: 60,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://images.app.goo.gl/f1m9tXorJtjdhCFy6"),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Leader Name : $lname",
                    style: TextStyle(fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Started Date : $date",
                    style: TextStyle(fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Age : $age",
                    style: TextStyle(fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Team_Member(User user, String mname, String date, int age) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
            ),
          ],
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height * 0.12,
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Container(
                width: 60,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://images.app.goo.gl/f1m9tXorJtjdhCFy6"),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Member Name : $mname",
                    style: TextStyle(fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Joining Date : $date",
                    style: TextStyle(fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Age : $age",
                    style: TextStyle(fontSize: 17),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

  Widget logout() => ButtonWidget(
        text: 'Log Out',
        onClicked: () {
          AuthController.instance.logout();
        },
      );
}
