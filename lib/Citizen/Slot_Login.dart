import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Slot_Login extends StatefulWidget {
  Slot_Login({Key? key, required this.area}) : super(key: key);
  final String area;

  @override
  State<Slot_Login> createState() => _Slot_LoginState();
}

class _Slot_LoginState extends State<Slot_Login> {
  // String place_name= area;

  List <String> items=["9:00 To 10:00","10:00 To 11:00","4:00 To 5:00","5:00 To 6:00"];
  String? selectedItem='9:00 To 10:00';

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title:Text("Slot Login"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:<Widget> [
              SizedBox(height: 20,),
              Text("${widget.area}",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green.shade800),),
              const Divider(
                height: 20,
                thickness: 4,
                indent: 20,
                endIndent: 20,
                color: Color(0xFF206F24),
              ),
              SizedBox(height: 30,),
          Row(
            children: [
              Text(
                "Name:",
                style:
                TextStyle(fontSize: 20, color: Colors.green[600]),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 7,
                      offset: Offset(1, 1),
                      color: Colors.grey.withOpacity(0.2))
                ]),
            child: TextField(
              // controller: fnameController,
              decoration: InputDecoration(
                  hintText: "Enter Your First Name",
                  // prefixIcon: Icon(Icons.nam, color:Colors.green),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.white, width: 1.0)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Colors.white, width: 1.0)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),



              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Mobile Number:",
                    style:
                    TextStyle(fontSize: 20, color: Colors.green[600]),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: TextField(
                  // controller: mobileController,
                  decoration: InputDecoration(
                      prefixText: "+91  ",
                      // prefixIcon: Icon(Icons.email, color:Colors.green),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.white, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white, width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  // keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Date:",
                    style:
                    TextStyle(fontSize: 20, color: Colors.green[600]),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: TextField(
                  // controller: dobController,
                  decoration: InputDecoration(
                      hintText: "dd/mm/yyyy",
                      // prefixIcon: Icon(Icons.email, color:Colors.green),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.white, width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              color: Colors.white, width: 1.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Time:",
                    style:
                    TextStyle(fontSize: 20, color: Colors.green[600]),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                margin: EdgeInsets.only(top: 5,left: 3),
                child: SizedBox(
                  width: w * 0.99,

                  child:DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      // enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color:Colors.green)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.white, width: 1.0)),
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.circular(30))),
                    ),
                  value: selectedItem,
                  items: items.map((item) => DropdownMenuItem(value: item,child: Text(item))).toList(),
                  onChanged: (item)=> setState(()=>selectedItem=item),
                )
                ),
              ),
              SizedBox(
                height: 40,
              ),
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
                        "Book Now",
                        style: TextStyle(
                          // backgroundColor: Colors.green[600],
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),



            ],
          ),
        ),
      ),




    );
  }
}

