import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';

class Clientdetails extends StatelessWidget {

  // String itemId;
  // String name;
  // String time;
  // String address;
  // String place;
  // String city;
  // String district;
  // String state;
  // String phonenumber;
  // String type;
   Clientdetails({super.key,
   //   required this.itemId,
   //   required this.name,
   //   required this.time,
   //   required this.address,
   //   required this.place,
   //   required this.city,
   //   required this.district,
   //   required this.state,
   //   required this.phonenumber,
   // required this.type,
   });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: brown3,
          title: Text("Client Details",
              style: TextStyle(
                  fontFamily: "cabin",
                  color: Text1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                   Padding(
                    padding: const EdgeInsets.all(12
                    ),
                    child: Consumer<mainProvider>(
                      builder: (context,value,child) {
                        value.getBooking("");
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: value.bookinglist.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 350,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Text1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Name:",
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              value.bookinglist[index].Name,
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
                                              "Time:",
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              value.bookinglist[index].Time,
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
                                              "Address:",
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              value.bookinglist[index].Address,

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
                                              "Place:",
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              value.bookinglist[index].Place,
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ), Row(
                                          children: [
                                            Text(
                                              "City:",
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              value.bookinglist[index].Name,
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ), Row(
                                          children: [
                                            Text(
                                              "District:",
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              value.bookinglist[index].District,
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ), Row(
                                          children: [
                                            Text(
                                              "State:",
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              value.bookinglist[index].State,
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ), Row(
                                          children: [
                                            Text(
                                              "Phone Number:",
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              value.bookinglist[index].Phonenumber,
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
                                              "Type Of Mehendi:",
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              value.bookinglist[index].Type,
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
                                              "Description:",
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              value.bookinglist[index].Desc,
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        );
                      }
                    ),
                  ),
        
          ],
        ),
      ),

    );
  }
}
