import 'package:brown_lines/CONSTANT/Colors.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Deliverydetailspage.dart';
import 'package:brown_lines/USER/Homepage.dart';
import 'package:brown_lines/USER/Paymentpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Bottomnavigation.dart';

class Totalpage extends StatelessWidget {
  String userId;
  Totalpage({super.key,required this.userId});



  List<String> Summary = [
    "Sealant spray (1 item)",
    "Sealant spray (1 item)",
  ];
  List<String> Productrate = [

    "₹ 50",
    "₹ 50",
  ];

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => Deliverydetailspage(userId: userId,)));
              },
              child: Icon(Icons.arrow_back, color: brown1, size: 34)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment",
                style: TextStyle(
                  fontSize: 20,
                  color: Text1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.cartlist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start

                            ,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            value.cartlist[index].Photo),
                                        fit: BoxFit.fill)),
                              ),
                              Consumer<mainProvider>(
                                builder: (context,value,child) {
                                  return SizedBox(
                                    width: width/3,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          value.cartlist[index].Name,
                                          style: TextStyle(
                                            color: Text1,
                                            fontSize: 16,

                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text("Qty:",style: TextStyle(
                                              color: Text1,
                                              fontSize: 16,
                                            ),),
                                            Text(
                                              value.cartlist[index].qty
                                                  .toString(),
                                              style: TextStyle(
                                                color: Text1,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              ),

                              Row(
                                children: [
                                  Text("₹",style: TextStyle(
                                color: Text1,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),),
                                  Text(
                                   value.cartlist[index].TotalPrice,
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 16,

                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                }
              ),
              Divider(
                thickness: 1,
                color: Text1,
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(height: 20,),
              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // SizedBox(width: 70,),
                        Text(
                          value.calculateTotalPrice().toStringAsFixed(2),
                          style: TextStyle(
                            color: Text1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Consumer<mainProvider>(
                  builder: (context,val,child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // SizedBox(width: 70,),
                        Text(
                          "₹ ${val.deliPrice}",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
              SizedBox(height: 20,),
              Divider(
                thickness: 1,
                color: Text1,
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(height: 20,),
              Consumer<mainProvider>(
                builder: (context,val,child) {
                  String grandTotal="";
                  grandTotal=(val.calculateTotalPrice()+double.parse(val.deliPrice)).toStringAsFixed(2);
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        // SizedBox(width: 70,),
                        Text(grandTotal,
                          style: TextStyle(
                            color: Text1,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              ),
              SizedBox(height: 80,),
              Center(
                child: Consumer<mainProvider>(
                  builder: (context,val,child) {
                    return InkWell(
                      onTap: () {
                        val.confirmOrder(val.cartlist, double.parse(val.deliPrice,),userId);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>bottomnavigation(Userid: userId, Username: '', Usernumber: '',)));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Your booking has been confirmed. Thank you for choosing our service!",
                              style: TextStyle(color: Colors.white), // Text color
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 3),

                          ),
                        );

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
