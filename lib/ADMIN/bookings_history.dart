import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../CONSTANT/Colors.dart';
import '../MODELCLASS/modelclass.dart';
import 'Bookeduserdetails.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';

class BookingsHistory extends StatelessWidget {
  const BookingsHistory({super.key});

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
                children: [
                  Container(
                      height: height / 16,
                      width: width/1.36,
                      color: Colors.transparent,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        // controller: val.MemberHouseSearchController,
                        textAlign: TextAlign.start,
                        cursorColor: Text1,
                        cursorHeight: 18,
                        style: TextStyle(
                          height: 1.5,
                          color: Text1,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search Model,Phone and Place',
                          hintStyle: TextStyle(
                            color: Text1,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.search_rounded, color: Text1),

                          border: OutlineInputBorder(
                            borderSide: BorderSide(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:  BorderSide(color: Text1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:  BorderSide(color: Text1),
                          ),
                        ),
                        onChanged: (value) {
                          val.searchFunction(value);
                        },
                      )
                  ),

                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: val.filterAdminHistoryBookingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = val.filterAdminHistoryBookingList[index];

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: item.status=="COMPLETE"?Colors.green:Colors.red,
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
                                  InkWell(
                                    onTap: () async {
                                      String phoneNumber = item.Phonenumber;
                                      String url = 'tel:$phoneNumber';
                                      try {
                                        if (await launcher.canLaunch(url)) {
                                          await launcher.launch(url);
                                        } else {
                                          print('Could not launch $url');
                                        }
                                      } on PlatformException catch (e) {
                                        print(
                                            'Error launching phone app: ${e.message}');
                                      } catch (e) {
                                        print('Unexpected error: $e');
                                      }
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: Text1),
                                      ),
                                      child: Icon(Icons.phone, color: Text1),
                                    ),
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
                                  InkWell(
                                    onTap: () {
                                      _showBookingDetailsDialog(context, item);
                                    },
                                    child: Text(
                                      "View more",
                                      style: TextStyle(
                                        color: Text1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),

                                  item.status=="COMPLETE"?
                                  Text(
                                    "Booking Completed",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ):
                                  Text(
                                    "Booking Canceled",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
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
