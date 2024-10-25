import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../CONSTANT/Colors.dart';
import '../MODELCLASS/modelclass.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';

class MyBookings extends StatelessWidget {
  const MyBookings({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: brown3,
          title: Text(
            "History of Bookings",
            style: TextStyle(
              fontFamily: "cabin",
              color: Text1,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<mainProvider>(
          builder: (context, val, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //   child: Container(
                  //       height: height / 16,
                  //       width: width/1.36,
                  //       color: Colors.transparent,
                  //       child: TextFormField(
                  //         keyboardType: TextInputType.text,
                  //         // controller: val.MemberHouseSearchController,
                  //         textAlign: TextAlign.start,
                  //         cursorColor: Text1,
                  //         cursorHeight: 18,
                  //         style: TextStyle(
                  //           height: 1.5,
                  //           color: Text1,
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 15,
                  //         ),
                  //         decoration: InputDecoration(
                  //           hintText: 'Search Model,Phone and Place',
                  //           hintStyle: TextStyle(
                  //             color: Text1,
                  //             fontSize: 12,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //           fillColor: Colors.white,
                  //           filled: true,
                  //           prefixIcon: Icon(Icons.search_rounded, color: Text1),
                  //
                  //           border: OutlineInputBorder(
                  //             borderSide: BorderSide(style: BorderStyle.none),
                  //             borderRadius: BorderRadius.circular(10),
                  //           ),
                  //           enabledBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //             borderSide:  BorderSide(color: Text1),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //             borderSide:  BorderSide(color: Text1),
                  //           ),
                  //         ),
                  //         onChanged: (value) {
                  //           val.searchFunction(value);
                  //         },
                  //       )
                  //   ),
                  // ),
                  SizedBox(height: 10,),

                  Text(
                    "New Bookings",
                    style: TextStyle(
                      color: Text1,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: val.filterMyBookingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = val.filterMyBookingList[index];

                      return item.status=="PENDING"? Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Date and Phone Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Date: ",
                                        style: TextStyle(
                                          color: Text1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        item.Time,
                                        style: TextStyle(
                                          color: Text1,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // Other details (Model, Phone, Place)
                              Row(
                                children: [
                                  Text(
                                    "Model: ",
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    item.model,
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Phone: ",
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    item.Phonenumber,
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Place: ",
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    item.Place,
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),

                              // View more and Action Buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 SizedBox(),

                                  item.status=="COMPLETE"?
                                  Text(
                                    "Booking Completed",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ):item.status=="REJECT"?
                                  Text(
                                    "Booking Canceled",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ):
                                  Text(
                                    "Booking Placed",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ):SizedBox();
                    },
                  ),
                  Text(
                    "Previous Bookings",
                    style: TextStyle(
                      color: Text1,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: val.filterMyBookingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = val.filterMyBookingList[index];

                      return item.status!="PENDING"? Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:item.status=="COMPLETE"?Colors.green:Colors.red,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Date and Phone Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Date: ",
                                        style: TextStyle(
                                          color: Text1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        item.Time,
                                        style: TextStyle(
                                          color: Text1,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // Other details (Model, Phone, Place)
                              Row(
                                children: [
                                  Text(
                                    "Model: ",
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    item.model,
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Phone: ",
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    item.Phonenumber,
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Place: ",
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    item.Place,
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),

                              // View more and Action Buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(),

                                  item.status=="COMPLETE"?
                                  Text(
                                    "Completed",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ):item.status=="REJECT"?
                                  Text(
                                    "Canceled",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ):
                                  Text(
                                    "Booking Placed",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ):SizedBox();
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showBookingDetailsDialog(BuildContext context, AdminBookingModel item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Booking Details"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Name: ${item.Name}"),
                Text("Date: ${item.Time}"),
                Text("Phone: ${item.Phonenumber}"),
                Text("Model: ${item.model}"),
                Text("Address: ${item.Address}"),
                Text("Place: ${item.Place}"),
                Text("City: ${item.City}"),
                Text("District: ${item.District}"),
                Text("State: ${item.State}"),
                Text("Type: ${item.Type}"),
                Text("Description: ${item.Desc}"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
