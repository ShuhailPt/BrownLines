import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Loginpage.dart';
import 'package:brown_lines/USER/my_bookings.dart';
import 'package:brown_lines/USER/my_order.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ADMIN/products.dart';
import '../CONSTANT/Colors.dart';
import '../PROVIDER/loginProvider.dart';

class Userprofilepage extends StatelessWidget {
  String userId;
  String userName;
  String userNumber;

  Userprofilepage(
      {super.key,
      required this.userId,
      required this.userName,
      required this.userNumber});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget btn(Color myColor, String text, Color textmycolor, double width,
        double height, double fonsize, FontWeight fntw) {
      return Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: myColor,
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: fonsize, fontWeight: fntw, color: textmycolor),
          )),
        ),
      );
    }

    return Scaffold(
      backgroundColor: brown3,
      body: Column(
        children: [
          SizedBox(
            height: 700,
            child: Stack(children: [
              Container(
                height: 350,
                width: 500,
                decoration: BoxDecoration(color: Text1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 74, top: 20),
                        child: Consumer<mainProvider>(
                            builder: (context, value, child) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showBottomSheet(context);
                                },
                                child: value.userImageFile != null
                                    ? Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: brown3,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                            image: DecorationImage(
                                              image: FileImage(
                                                  value.userImageFile!),
                                              fit: BoxFit.cover,
                                            )),
                                      )
                                    : Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            color: brown3,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100))),
                                        child: Center(
                                          child: Icon(
                                            CupertinoIcons.profile_circled,
                                            size: 100,
                                            color: Text1,
                                          ),
                                        ),
                                      ),
                              ),
                              value.userImageFile != null
                                  ? TextButton(
                                      onPressed: () {
                                        value.addOrUpdateUserImage(userId);
                                      },
                                      child: Text("Done"))
                                  : Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            userName,
                                            style: TextStyle(
                                                color: brown1,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            userNumber,
                                            style: TextStyle(
                                                color: brown1,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          );
                        }),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.transparent,
                              elevation: 20,
                              content: Text("Do you want to Logout ?",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                              actions: <Widget>[
                                Consumer<loginprovider>(
                                  builder: (context, value, child) {
                                    return TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Colors.red),
                                          shape: WidgetStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)))),
                                      onPressed: () {
                                        FirebaseAuth auth =
                                            FirebaseAuth.instance;
                                        auth.signOut();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Loginpage(),
                                            ));
                                        value.clearLoginPageNumber();
                                      },
                                      child: Center(
                                          child: Text("Yes",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                    );
                                  },
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.green),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12)))),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Center(
                                        child: Text("No",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700))))
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.logout),
                        color: brown3,
                        iconSize: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 240,
                left: 16,
                child: Container(
                  height: 400,
                  width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30), color: brown2),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(height: 15,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "My Date",
                                    style: TextStyle(
                                        color: Text1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // SizedBox(width: 206,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Text1,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: Text1,
                              indent: 15,
                              endIndent: 15,
                            ),
                          ],
                        ),
                        Consumer<mainProvider>(
                          builder: (context,val,child) {
                            return InkWell(
                              onTap: (){
                                val.getMyOrder(userId);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrder()));

                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "My Order",
                                          style: TextStyle(
                                              color: Text1,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Text1,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Text1,
                                    indent: 15,
                                    endIndent: 15,
                                  ),
                                ],
                              ),
                            );
                          }
                        ),
                        Consumer<mainProvider>(
                          builder: (context,val,child) {
                            return InkWell(
                              onTap: (){
                                val.getMyBookings(userId);
                                print(userId);

                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBookings()));
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "My Bookings",

                                          style: TextStyle(
                                              color: Text1,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Text1,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Text1,
                                    indent: 15,
                                    endIndent: 15,
                                  ),
                                ],
                              ),
                            );
                          }
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Change Phone Number",
                                    style: TextStyle(
                                        color: Text1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Text1,
                                      size: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: Text1,
                              indent: 15,
                              endIndent: 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}

void showBottomSheet(BuildContext context) {
  mainProvider provider = Provider.of<mainProvider>(context, listen: false);
  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.camera_enhance_sharp,
                  color: Text1,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () => {
                      provider.pickUserImageFromCamera(),
                      Navigator.pop(context)
                    }),
            ListTile(
                leading: Icon(Icons.photo, color: Text1),
                title: const Text(
                  'Gallery',
                ),
                onTap: () => {
                      provider.pickUserImageFromGallery(),
                      // Navigator.pop(context)
                    }),
          ],
        );
      });
  // ImageSource
}
