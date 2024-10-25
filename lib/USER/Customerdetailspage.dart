import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Cartpage.dart';
import 'package:brown_lines/USER/Deliverydetailspage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';

class Customerdetailspage extends StatelessWidget {
  String from;
  String oldid;
  Customerdetailspage({super.key,required this.from,required this.oldid});


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget btn(Color myColor, String text, Color textmycolor, double width,
        double height, double fonsize, FontWeight fntw) {
      return Padding(
        padding: EdgeInsets.only(bottom: 20, top: 20, left: 5, right: 5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Text1,
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: fonsize, fontWeight: fntw, color: Colors.white),
          )),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          shape: Border(
            bottom: BorderSide(width: 2, color: Text1),
          ),
          backgroundColor: white,
          leading: Icon(Icons.arrow_back, color: Text1, size: 34),


        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Customer Details",
                style: TextStyle(
                  fontSize: 20,
                  color: Text1,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
               Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Consumer<mainProvider>(
                            builder: (context,value,child) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Text1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  controller: value.emailCt,
                                  decoration: InputDecoration(border: InputBorder.none),
                                ),
                              );
                            }
                          ),
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Consumer<mainProvider>(
                            builder: (context,value,child) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Text1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  controller: value.name2Ct,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              );
                            }
                          ),
                        ),
                        Text(
                          "Address",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Consumer<mainProvider>(
                            builder: (context,value,child) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Text1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  controller: value.address2Ct,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              );
                            }
                          ),
                        ),
                        Text(
                          "State",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Consumer<mainProvider>(
                            builder: (context,value,child) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Text1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  controller: value.state2Ct,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              );
                            }
                          ),
                        ),  Text(
                          "District",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Consumer<mainProvider>(
                            builder: (context,value,child) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Text1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  controller: value.district2Ct,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              );
                            }
                          ),
                        ),  Text(
                          "City",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Consumer<mainProvider>(
                            builder: (context,value,child) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Text1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  controller: value.city2Ct,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              );
                            }
                          ),
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Consumer<mainProvider>(
                            builder: (context,value,child) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Text1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  controller: value.phonenumber2Ct,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              );
                            }
                          ),
                        ),
                        Text(
                          "Zipcode",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Consumer<mainProvider>(
                            builder: (context,value,child) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Text1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  controller: value.zipcodeCt,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              );
                            }
                          ),
                        ),
                    ]
                  ),
             Consumer<mainProvider>(
               builder: (context,value,child) {
                 return InkWell(
                     onTap: () {
                       if ( from == "NEW"){
                         value.addShopOrder(from," ");
                       }else{
                         value.addShopOrder(from,oldid);
                       }
                       value.getShopOrder();

                       Navigator.push(
                           context, MaterialPageRoute(builder: (contex) => Deliverydetailspage(userId: '',)));
                     },
                     child: btn(Text1, "Continue", white, 340, 40, 18, FontWeight.w500));
               }
             ),
            ],
          ),
        ),
      ),
    );
  }
}
