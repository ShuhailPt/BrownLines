import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../CONSTANT/Colors.dart';
import '../MODELCLASS/modelclass.dart';

import 'package:brown_lines/PROVIDER/mainProvider.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: brown3,
          title: Text(
            "List of Order",
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
                  Text(
                    "New Orders",
                    style: TextStyle(
                      color: Text1,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: val.filterMyOrderList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = val.filterMyOrderList[index];

                      return item.orderStatus=="PENDING"?Container(
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
                                        item.orderDate,
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
                                    "Customer: ",
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    item.orderPerson,
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
                                    item.orderPhone,
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
                                    item.orderPlace,
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),

                              // View more and Action Buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap:(){
                                      _showItems(context, item);
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Text1),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "View items",
                                          style: TextStyle(
                                            color: Text1,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Consumer<mainProvider>(
                                      builder: (context,val,child) {
                                        return Row(
                                          children: [
                                            Text(
                                              "Order Processed",
                                              style: TextStyle(
                                                color: Colors.yellow,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ):SizedBox();
                    },
                  ),

                  Text(
                    "Previous Orders",
                    style: TextStyle(
                      color: Text1,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: val.filterMyOrderList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = val.filterMyOrderList[index];

                      return item.orderStatus!="PENDING"?Container(
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
                                        item.orderDate,
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
                                    "Customer: ",
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    item.orderPerson,
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
                                    item.orderPhone,
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
                                    item.orderPlace,
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),

                              // View more and Action Buttons
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap:(){
                                      _showItems(context, item);
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Text1),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "View items",
                                          style: TextStyle(
                                            color: Text1,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Consumer<mainProvider>(
                                      builder: (context,val,child) {
                                        return Row(
                                          children: [
                                            item.orderStatus=="CONFIRM"?
                                            Text(
                                              "Order Placed",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ):item.orderStatus=="SHIPPED"?
                                            Text(
                                              "Order Shipped",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ):
                                            Text(
                                              "Order Canceled",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )

                                          ],
                                        );
                                      }
                                  ),
                                ],
                              )
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

  void _showItems(BuildContext context, AdminOrderModel item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Grand Total: "+item.orderGrandTotal,style: TextStyle(color: Text1,fontWeight: FontWeight.w700),),
          content: SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: item.orderItems.length,
                itemBuilder: (BuildContext context,int index){
                  var item2=item.orderItems[index];
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
                            children: [
                              item2.productPhoto != null && item2.productPhoto.isNotEmpty
                                  ? Image.network(item2.productPhoto,height: 40,width: 40,)
                                  : Icon(Icons.broken_image),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Item: ",
                                        style: TextStyle(
                                          color: Text1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        item2.productName,
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
                                        "Quantity: ",
                                        style: TextStyle(
                                          color: Text1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        item2.quantity,
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
                                        "Total Price: ",
                                        style: TextStyle(
                                          color: Text1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        item2.totalPrice,
                                        style: TextStyle(
                                          color: Text1,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                  );

                }),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close",style: TextStyle(color: Colors.red),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showBookingDetailsDialog(BuildContext context, AdminOrderModel item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Booking Details",style: TextStyle(color: Text1,fontWeight: FontWeight.w700),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Name: ${item.orderPerson}"),
                Text("Date: ${item.orderDate}"),
                Text("Phone: ${item.orderPhone}"),
                Text("Delivery: ${item.orderDelivery}"),
                Text("Address: ${item.orderAddress}"),
                Text("Place: ${item.orderPlace}"),
                Text("City: ${item.orderCity}"),
                Text("District: ${item.orderDistrict}"),
                Text("State: ${item.orderState}"),
                // Text("Type: ${item.Type}"),
                // Text("Description: ${item.}"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Close",style: TextStyle(color: Colors.red,),),
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
