import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../CONSTANT/Colors.dart';
import '../MODELCLASS/modelclass.dart';
import 'Bookeduserdetails.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: brown3,
          title: Text(
            "List of Bookings",
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
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: val.adminBookingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = val.adminBookingList[index];

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Text1,
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
                                  Consumer<mainProvider>(
                                    builder: (context,val,child) {
                                      return Row(
                                        children: [
                                          InkWell(
                                            onTap:(){
                                              val.rejectBooking(item.id);
                                      },
                                            child: Container(
                                              height: 35,
                                              width: 82,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Colors.red),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Reject",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30),
                                          InkWell(
                                            onTap: (){
                                              val.confmBooking(item.id);
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 82,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: Colors.green),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Confirm",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                  ),
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
