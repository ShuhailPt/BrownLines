import 'package:brown_lines/ADMIN/Addproducts.dart';
import 'package:brown_lines/ADMIN/Clientslist.dart';
import 'package:brown_lines/ADMIN/Feedpageadmin.dart';
import 'package:brown_lines/ADMIN/confirmed_orders.dart';
import 'package:brown_lines/ADMIN/oredr_history.dart';
import 'package:brown_lines/ADMIN/products.dart';
import 'package:brown_lines/ADMIN/AddAdvertisement.dart';
import 'package:brown_lines/ADMIN/Addfeedpage.dart';
import 'package:brown_lines/ADMIN/Addpostimage.dart';
import 'package:brown_lines/ADMIN/Postimage.dart';
import 'package:brown_lines/ADMIN/Productorders1.dart';
import 'package:brown_lines/ADMIN/Productorders2.dart';
import 'package:brown_lines/ADMIN/products.dart';
import 'package:brown_lines/ADMIN/Userspage.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import '../PROVIDER/loginProvider.dart';
import '../USER/Loginpage.dart';
import 'Advertisement2.dart';
import 'Clientdetails.dart';
import 'bookings_history.dart';
import 'bookings_page.dart';
import 'confirm_bookings.dart';
import 'order_page.dart';

class Adminpages extends StatelessWidget {
  const Adminpages({super.key});

  @override
  Widget build(BuildContext context)
    {
      var width = MediaQuery.of(context).size.width;
      var height = MediaQuery.of(context).size.height;
      Widget btn(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw) {
        return Padding(
          padding: EdgeInsets.only(top: 20, left: 5, right: 5),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: brown3,
            ),
            child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: fonsize, fontWeight:fntw, color: textmycolor),
                )),
          ),
        );
      }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(


          backgroundColor: brown3,
          title: Text(
              "Admin Pages",
              style: TextStyle(
                  fontFamily: "cabin",
                  color: Text1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
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
                color: Colors.redAccent,
                iconSize: 30,
              ),
            ),
          ],

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Consumer<mainProvider>(
                builder: (context,val,child) {
                  return InkWell(
                      onTap: () {
                        val.getAllBookings();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (contex) => BookingsPage()));
                      },
                      child: btn(Text1, "Customer Bookings", Text1, 330,60,16,FontWeight.w500));
                }
            ),
            Consumer<mainProvider>(
                builder: (context,val,child) {
                  return InkWell(
                      onTap: () {
                        val.getConfirmBookings();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (contex) => ConfirmBookings()));
                      },
                      child: btn(Text1, "Confirm Bookings", Text1, 330,60,16,FontWeight.w500));
                }
            ),
            Consumer<mainProvider>(
                builder: (context,val,child) {
                  return InkWell(
                      onTap: () {
                        val.getAllOrder();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (contex) => OrderPage()));
                      },
                      child: btn(Text1, "Customer Order", Text1, 330,60,16,FontWeight.w500));
                }
            ),
            Consumer<mainProvider>(
                builder: (context,val,child) {
                  return InkWell(
                      onTap: () {
                        val.getConfirmdeOrder();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (contex) => ConfirmedOrders()));
                      },
                      child: btn(Text1, "Confirmed Orders", Text1, 330,60,16,FontWeight.w500));
                }
            ),
            Consumer<mainProvider>(
              builder: (context,value,child) {
                return InkWell(
                    onTap: () {
                      value.getAdvtImage();
                      Navigator.push(
                          context, MaterialPageRoute(builder: (contex) => Advertisement2(from: "NEW", oldid: "")));
                    },
                    child: btn(Text1, "Addadvertisement", Text1, 330,60,16,FontWeight.w500));
              }
            ),


            Consumer<mainProvider>(
              builder: (context,value,child) {
                return InkWell(
                    onTap: () {
                   value.getPostImage();
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Postimage(from: "NEW", oldid: "")));
                    },
                    child: btn(Text1, "Add post image", Text1, 330,60,16,FontWeight.w500));
              }
            ),


            Consumer<mainProvider>(
              builder: (context,value,child) {
                return InkWell(
                    onTap: () {
                      value.getProductImage();
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => products(from: "NEW", oldid: "")));
                    },
                    child: btn(Text1, "Add Products", Text1, 330,60,16,FontWeight.w500));
              }
            ),
            Consumer<mainProvider>(
              builder: (context,value,child) {
                return InkWell(
                    onTap: () {
                      value.getFeedImage();
                      Navigator.push(
                          context, MaterialPageRoute(builder: (contex) => Feedpageadmin(from: 'NEW',oldid: "")));
                    },
                    child: btn(Text1, "Add feed page", Text1, 330,60,16,FontWeight.w500));
              }
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (contex) => Productorders2()));
                },
                child: btn(Text1, "Product Orders 2", Text1, 330,60,16,FontWeight.w500)),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (contex) => Productorders2()));
                },
                child: btn(Text1, "Feed Page 1", Text1, 330,60,16,FontWeight.w500)),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (contex) => Productorders2()));
                },
                child: btn(Text1, "Feed Page 2", Text1, 330,60,16,FontWeight.w500)),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (contex) => Userspage()));
                },
                child: btn(Text1, "Users List", Text1, 330,60,16,FontWeight.w500)),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (contex) => Clientdetails()));
                },
                child: btn(Text1, "Clients List", Text1, 330,60,16,FontWeight.w500)),

            Consumer<mainProvider>(
                builder: (context,val,child) {
                  return InkWell(
                      onTap: () {
                        val.getHistoryBookings();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (contex) => BookingsHistory()));
                      },
                      child: btn(Text1, "Bookings History", Text1, 330,60,16,FontWeight.w500));
                }
            ),
            Consumer<mainProvider>(
                builder: (context,val,child) {
                  return InkWell(
                      onTap: () {
                        val.getHistoryOrder();
                        Navigator.push(
                            context, MaterialPageRoute(builder: (contex) => OredrHistory()));
                      },
                      child: btn(Text1, "Order History", Text1, 330,60,16,FontWeight.w500));
                }
            ),

            SizedBox(height: 50,),

          ],
        ),
      ),
    );
  }
}
