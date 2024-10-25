import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Customerdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import '../MODELCLASS/modelclass.dart';
import 'CalendarPage.dart';
import 'Totalpage.dart';

class Deliverydetailspage extends StatelessWidget {
  String userId;
   Deliverydetailspage({super.key,required this.userId});




  @override
  Widget build(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    btn(Color myColor, String text, Color textmycolor, double width,
        double height, double fonsize, FontWeight fntw) {
      return Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Text1,
          leading: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => Customerdetailspage(from: '', oldid: '',)));
              },
              child: Icon(Icons.arrow_back, color: brown1, size: 34)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Customer and Delivery Details",
                style: TextStyle(
                  fontSize: 20,
                  color: Text1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Consumer<mainProvider>(
                builder: (context,val,child) {
                  val.getBooking(userId);
                  return Column(
                    children: [
                      val.bookinglist.isEmpty?
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: const Text("Please add new address",style: TextStyle(fontSize: 22),),
                      ):
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                          itemCount: val.bookinglist.length,
                          itemBuilder: (context, index) {
                            BookingModel booking = val.bookinglist[index];
                            bool isSelected = booking.id == val.selectedAddress?.id;

                            return GestureDetector(
                              onTap: () {
                                val.selectAddress(booking); // Select address on tap
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: isSelected ? Colors.blue : Text1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      isSelected
                                          ? Icons.radio_button_checked // Selected state
                                          : Icons.radio_button_unchecked, // Unselected state
                                      color: isSelected ? Colors.blue : Text1,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            booking.Name,
                                            style: TextStyle(color: Text1, fontSize: 16),
                                          ),
                                          Text(
                                            "${booking.Address}, ${booking.City}, ${booking.State}",
                                            style: TextStyle(color: Text1, fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete, color: Colors.red),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text("Delete Address"),
                                              content: Text("Are you sure you want to delete this address?"),
                                              actions: [
                                                TextButton(
                                                  child: Text("Cancel"),
                                                  onPressed: () => Navigator.of(context).pop(),
                                                ),
                                                TextButton(
                                                  child: Text("Delete"),
                                                  onPressed: () {
                                                    val.deleteAddress(booking.id,userId); // Delete address
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      // "Add New Address" styled like ListView item
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CalendarPage(from: 'NEW', oldid: '', userId: userId, model: '',),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Text1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_circle_outline, // Add icon
                                color: Text1,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Add New Address",
                                  style: TextStyle(color: Text1, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              ),
              SizedBox(height: 20,),
              Divider(
                height: 3,
                color: Text1,
                indent: 4,
                endIndent: 4,
                thickness: 1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                   Text(
                    "Delivery Method",
                    style: TextStyle(
                      fontSize: 20,
                      color: Text1, // Replace Text1 with your actual color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                   Text(
                    "Shipping & Delivery",
                    style: TextStyle(
                      fontSize: 14,
                      color: Text1, // Replace Text1 with your actual color
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  _buildDeliveryOption(
                    index: 0,
                    title: "Standard Delivery",
                    description: "Dispatch within 48 hours",
                    price: "60",
                  ),
                  const SizedBox(height: 10),
                  _buildDeliveryOption(
                    index: 1,
                    title: "Express Delivery",
                    description: "Dispatch within 24 hours",
                    price: "80",
                  ),
                  const SizedBox(height: 10),
                  _buildDeliveryOption(
                    index: 2,
                    title: "Standard Delivery",
                    description: "Dispatch within 48 hours",
                    price: "60",
                  ),
                ],
              ),
              Center(
                child: Consumer<mainProvider>(
                  builder: (context,val,child) {
                    return InkWell(
                      onTap: () {
                        if (val.selectedAddress != null && val.deliPrice!="") {
                          // val.confirmBooking();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (contex) => Totalpage(userId: userId,)));
                        }
                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please select an address and delivery type")),
                          );
                        }

                      },
                      child: btn(Text1, "Continue", Colors.white, 300, 40, 18,
                          FontWeight.w500),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildDeliveryOption({
  required int index,
  required String title,
  required String description,
  required String price,
}) {
  return Consumer<mainProvider>(
    builder: (context, provider, child) {
      bool isSelected = provider.selectedMethod == index;
      return Center(
        child: Container(
          height: 80,
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Text1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.deliverySelect(index, title,price);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Icon(
                      isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                      size: 20,
                      color:Text1,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:  TextStyle(
                        fontSize: 18,
                        color: Text1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      description,
                      style:  TextStyle(
                        fontSize: 12,
                        color: Text1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text("₹ "+price
                  ,
                  style:  TextStyle(
                    fontSize: 18,
                    color: Text1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

