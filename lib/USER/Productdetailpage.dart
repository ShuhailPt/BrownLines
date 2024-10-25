import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Cartpage.dart';
import 'package:brown_lines/USER/Shophomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import '../MODELCLASS/modelclass.dart';

class Productdetailpage extends StatelessWidget {
  String itemId;
  String name;
  String price;
  String desciprtion;
  String photo;
  String Userid;
  Productdetailpage({
    super.key,
    required this.itemId,
    required this.name,
    required this.price,
    required this.photo,
    required this.desciprtion,
    required this.Userid,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget btn(Color myColor, String text, Color textmycolor, double width,
        double height, double fonsize, FontWeight fntw) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: brown2,
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
        backgroundColor: brown3,
        body: SingleChildScrollView(
          child:
              Consumer<mainProvider>(
                  builder: (context, value, child) {
                return Column(crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                  Container(
                    height: height/2,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      image: DecorationImage(
                          image: NetworkImage(photo), fit: BoxFit.fill),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Text1,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            color: Text1,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Text1,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          desciprtion,
                          style: TextStyle(
                            color: Text1,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 140,
                        ),
                      ],
                    ),
                  ),

                  Consumer<mainProvider>(

                      builder: (context,value,child) {
                        return InkWell(
                          onTap: () {
                            value.addtoCart(context,name,price,photo,Userid);
                            value.getCartDetails(Userid);
                          },

                          child: Container(
                            height: 40,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15)),
                                border: Border.all(color: Text1)),
                            child: Center(
                              child: Text(
                                "Add to Bag",
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                  SizedBox(height: 10,),
                  Consumer<mainProvider>(

                      builder: (context,value,child) {
                        return InkWell(
                          onTap: () {
                            value.addtoCart(context,name,price,photo,Userid);
                            value.getCartDetails(Userid);
                            print("aaa"+value.cartlist.length.toString());
                            Navigator.push(context,
                                MaterialPageRoute(builder: (contex) =>
                                    Cartpage(userId: Userid,

                                    )));
                          },
                          child: Container(
                            height: 40,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15)),
                                border: Border.all(color: Text1)),
                            child: Center(
                              child: Text(
                                "Buy Now",
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ]);
              }),
        ));
  }
}
