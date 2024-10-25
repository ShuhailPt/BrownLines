import 'package:brown_lines/USER/Thankyoupage2.dart';
import 'package:brown_lines/USER/Totalpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import '../PROVIDER/mainProvider.dart';

class Paymentpage extends StatelessWidget {
  String userId;
   Paymentpage({super.key,required this.userId});
  List<String> Details = [
    "aishahaseena7@gmail.com",
    "Aysha",
    "8139820087",
    "kongath House,Nattukal (po)",
    "678583",
    "Palakkad",
    "Kerala",
    "India",
  ];
   List<String> img = [
     "assets/sealant.jpg",
     "assets/sealant.jpg",
     "assets/sealant.jpg",
     "assets/sealant.jpg",
     "assets/sealant.jpg",
     "assets/sealant.jpg",
   ];
   List<String> Product = [
     "Sealant Spray",
     "Sealant Spray",
     "Sealant Spray",
     "Sealant Spray",
     "Sealant Spray",
     "Sealant Spray",
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
                        builder: (contex) => Totalpage(userId: userId,)));
              },
              child: Icon(Icons.arrow_back, color: brown1, size: 34)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Customer and Delivery Details",
                    style: TextStyle(
                      fontSize: 20,
                      color: Text1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 16,
                      color: Text1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Consumer<mainProvider>(
                  builder: (context,value,child) {
                    value.getShopOrder();
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.shoplist.length,
                        itemBuilder: (context,index){
                          return Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text( value.shoplist[index].Email, style: TextStyle(color: Text1,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),),
                              Text(value.shoplist[index].Name2 , style: TextStyle(color: Text1,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),),
                              Text(value.shoplist[index].Address2 , style: TextStyle(color: Text1,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),),

                              Text(value.shoplist[index].State2 , style: TextStyle(color: Text1,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),),
                              Text(value.shoplist[index].District2 , style: TextStyle(color: Text1,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),),
                              Text(value.shoplist[index].City2, style: TextStyle(color: Text1,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),),
                              Text(value.shoplist[index].Phonenumber2 , style: TextStyle(color: Text1,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),),
                              Text(value.shoplist[index].Zipcode , style: TextStyle(color: Text1,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),),

                            ],
                          );
                        });
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
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Method",
                    style: TextStyle(
                      fontSize: 20,
                      color: Text1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 16,
                      color: Text1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text(
                "Standard Delivery",
                style: TextStyle(
                  fontSize: 16,
                  color: Text1,
                ),
              ),
              Text(
                "Dispatch within 48 hours",
                style: TextStyle(
                  fontSize: 16,
                  color: Text1,

                ),
              ),
              SizedBox(height: 20,),
              Divider(
                height: 3,
                color: Text1,
                indent: 4,
                endIndent: 4,
                thickness: 1,
              ),
              SizedBox(height: 20,),
              Text(
                "Payment",
                style: TextStyle(
                  fontSize: 20,
                  color: Text1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 200,),
              Divider(
                height: 3,
                color: Text1,
                indent: 4,
                endIndent: 4,
                thickness: 1,
              ),
              SizedBox(height: 20,),
              Text(
                "Review & place order",
                style: TextStyle(
                  fontSize: 20,
                  color: Text1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Review the order details above, and place your order when you are ready.",
                style: TextStyle(
                  fontSize: 14,
                  color: Text1,

                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.check_box_outline_blank,color: Text1,
                  size: 20,),
                  SizedBox(width: 10,),
                  Text(
                    "I agree to the Terms & Conditions and Return\nPolicy..",
                    style: TextStyle(
                      fontSize: 14,
                      color: Text1,

                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.cartlist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            value.cartlist[index].Photo),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.cartlist[index].Name,
                                    style: TextStyle(
                                      color: Text1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
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
                              SizedBox(width: 66,),
                              Row(
                                children: [
                                  Text("₹",style: TextStyle(
                                    color: Text1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  Text(
                                    value.cartlist[index].Price,
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
              Padding(
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
                    SizedBox(width: 70,),
                    Text(
                      "₹ 350",
                      style: TextStyle(
                        color: Text1,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
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
                    SizedBox(width: 70,),
                    Text(
                      "₹ 50",
                      style: TextStyle(
                        color: Text1,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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
              Padding(
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
                    SizedBox(width: 70,),
                    Text(
                      "₹ 400",
                      style: TextStyle(
                        color: Text1,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contex) => Thankyoupage2()));
                  },
                  child: btn(Text1, "Place Order & Pay", Colors.white, 300, 40, 18,
                      FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
