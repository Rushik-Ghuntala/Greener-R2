import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

class SWT extends StatefulWidget {
  const SWT({Key? key}) : super(key: key);

  @override
  State<SWT> createState() => _SWTState();
}

class _SWTState extends State<SWT> {
  File? file;
  ImagePicker image = ImagePicker();

  String location ='Lat: ... , Long: ...';
  String Address = 'search';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Selfie With Tree"),
      ),
      body: Container(
        height: h,
        width: w,
        color: Colors.green[200],
        child: SingleChildScrollView(
          child: Container(
            color: Colors.green[200],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    height: 180,
                    width: 200,
                    color: Colors.black12,
                    child: file == null
                        ? Icon(
                      Icons.image,
                      size: 40,
                    )
                        : Image.file(
                      file!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      getcam();
                    },
                    color: Colors.green,
                    child: Text(
                      "take Selfie",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text(location,style: TextStyle(color: Colors.black,fontSize: 16),),
                        SizedBox(height: 10,),
                        Text('ADDRESS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text('${Address}'),
                        MaterialButton(onPressed: () async{
                          Position position = await _getGeoLocationPosition();
                          location ='Lat: ${position.latitude} , Long: ${position.longitude}';
                          GetAddressFromLatLong(position);
                        },color: Colors.green, child: Text('Get Location', style: TextStyle(color: Colors.white),))
                      ],
                    ),
                  ),
                  SizedBox(height: 100,),
                  GestureDetector(
                    onTap: () {
                      // AuthController.instance.registerCitizen(
                      //     emailController.text.trim(),
                      //     passwordController.text.trim(),
                      //     fnameController.text.trim(),
                      //     lnameController.text.trim(),
                      //     mobileController.text.trim(),
                      //     dobController.text.trim());
                    },
                    child: Container(
                        width: w * 0.5,
                        height: h * 0.08,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("img/g.jpg"), fit: BoxFit.cover)),
                        child: Center(
                          child: Text(
                            "Done",
                            style: TextStyle(
                              // backgroundColor: Colors.green[600],
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),

                  // Text("Position : $locationMessage"),
                  // MaterialButton(
                  //   onPressed: () {
                  //     // _getCurrentLocation().then((value){
                  //     //   lat = '${value.latitude}';
                  //     //   long = '${value.longitude}';
                  //     //   setState(() {
                  //     //     locationMessage = 'Latitude: $lat , Longitude: $long';
                  //     //   });
                  //     // });
                  //   },
                  //   color: Colors.blue,
                  //   child: Text(
                  //     "get Current Location",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // Text("Position : $locationMessage"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getcam() async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }
}

