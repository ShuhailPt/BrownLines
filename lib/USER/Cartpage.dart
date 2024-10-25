import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import '../PROVIDER/mainProvider.dart';
import 'Customerdetailspage.dart';

// class Cartpage extends StatelessWidget {
//   Cartpage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     Widget btn(Color myColor, String text, Color textmycolor, double width,
//         double height, double fonsize, FontWeight fntw) {
//       return Padding(
//         padding: EdgeInsets.only(bottom: 20, top: 20, left: 5, right: 5),
//         child: Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: brown2,
//           ),
//           child: Center(
//               child: Text(
//                 text,
//                 style: TextStyle(
//                     fontSize: fonsize, fontWeight: fntw, color: textmycolor),
//               )),
//         ),
//       );
//     }
//
//     return Scaffold(
//       backgroundColor: brown3,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(50),
//         child: AppBar(
//           shape: Border(
//             bottom: BorderSide(width: 2, color: Text1),
//           ),
//           backgroundColor: brown3,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text(
//                 "My Bag",
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Text1,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Consumer<mainProvider>(builder: (context, value, child) {
//                 return ListView.builder(
//                     physics: ScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: value.cartlist.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Container(
//                           height: 150,
//                           width: 280,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(15)),
//                             border: Border.all(
//                               color: Text1,
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: Container(
//                                   height: 130,
//                                   width: 130,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(15)),
//                                       image: DecorationImage(
//                                           image: NetworkImage(
//                                               value.cartlist[index].Photo),
//                                           fit: BoxFit.fill)),
//                                 ),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     value.cartlist[index].Name,
//                                     style: TextStyle(
//                                       color: Text1,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Container(
//                                     height: 60,
//                                     width: 100,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(30)),
//                                         border: Border.all(color: Text1)),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(10.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           GestureDetector(
//                                             onTap: () => value
//                                                 .decrementQuantity(index),
//                                             child: Image(
//                                               image: AssetImage(
//                                                   "assets/img_17.png"),
//                                               height: 26,
//                                             ),
//                                           ),
//                                           Text(
//                                             value.cartlist[index].quantity.toString(),
//                                             style: TextStyle(
//                                               color: Text1,
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           GestureDetector(
//                                             onTap: () => value
//                                                 .incrementQuantity(index),
//                                             child: Image(
//                                               image: AssetImage(
//                                                   "assets/img_18.png"),
//                                               height: 26,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 30),
//                                     child: GestureDetector(
//                                         onTap: () {
//                                           value.deleteFromCart(
//                                               context, value.cartlist[index].id);
//                                         },
//                                         child: Image(
//                                           image: AssetImage(
//                                               "assets/img_19.png"),
//                                           height: 26,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         bottom: 8, left: 10),
//                                     child: Text(
//                                       value.cartlist[index].Price,
//                                       style: TextStyle(
//                                         color: Text1,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     });
//               }),
//               SizedBox(height: 20),
//               Container(
//                 height: 190,
//                 width: 326,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                     border: Border.all(
//                       color: Text1,
//                     )),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 60,
//                       width: 346,
//                       decoration: BoxDecoration(
//                         color: Text1,
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(15),
//                             topLeft: Radius.circular(15)),
//                       ),
//                       child: Center(
//                         child: Text("ORDER SUMMARY",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             )),
//                       ),
//                     ),
//                     ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: 2,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "uu",
//                                   style: TextStyle(
//                                     color: Text1,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 Text(
//                                   "ghh",
//                                   style: TextStyle(
//                                     color: Text1,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         }),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Total",
//                             style: TextStyle(
//                               color: Text1,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "₹ 100",
//                             style: TextStyle(
//                               color: Text1,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (contex) => Customerdetailspage()));
//                   },
//                   child: btn(Text1, "Checkout", Colors.brown, 340, 40, 18,
//                       FontWeight.w500),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Customerdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import 'Deliverydetailspage.dart';
import 'Shophomepage.dart';

class Cartpage extends StatelessWidget {
  String userId;
  Cartpage({
    super.key,required this.userId
  });

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
      backgroundColor: brown3,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          shape: Border(
            bottom: BorderSide(width: 2, color: Text1),
          ),
          backgroundColor: brown3,
          // leading: InkWell(
          //     onTap: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (contex) => Shophomepage()));
          //     },
          //     child: Icon(Icons.arrow_back, color: Text1, size: 34)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   "My Bag",
              //   style: TextStyle(
              //     fontSize: 20,
              //     color: Text1,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Consumer<mainProvider>(builder: (context, value, child) {
                return value.cartlist.isEmpty?Text("There are no items in the cart",
                    style: TextStyle(
                      fontSize: 20,
                      color: Text1,
                      fontWeight: FontWeight.w500,
                    ),
                ): ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.cartlist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 150,
                          width: 280,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              color: Text1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  height: 130,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              value.cartlist[index].Photo),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,

                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                      value.cartlist[index].Name,
                                      style: TextStyle(
                                        color: Text1,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      height: 40,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30)),
                                          border: Border.all(color: Text1)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                value.countDecrement(index,
                                                    value.cartlist[index].id);
                                              },
                                              icon: Icon(
                                                CupertinoIcons.minus_circle,
                                              )),
                                          Text(
                                            value.cartlist[index].qty
                                                .toString(),
                                            style: TextStyle(
                                              color: Text1,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          IconButton(
                                            icon:
                                                Icon(CupertinoIcons.plus_circle),
                                            onPressed: () {
                                              value.countIncrement(index,
                                                  value.cartlist[index].id);
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: GestureDetector(
                                        onTap: () {
                                          value.deleteFromCart(context,
                                              value.cartlist[index].id);
                                        },
                                        child: Image(
                                          image:
                                              AssetImage("assets/img_19.png"),
                                          height: 26,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, left: 10),
                                    child: Text(
                                      value.cartlist[index].qty==1?
                                      value.cartlist[index].Price.toString() :value.cartlist[index].TotalPrice.toString(),
                                      style: TextStyle(
                                        color: Text1,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }),
              SizedBox(
                height: 20,
              ),
              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return Container(
                     width: 326,
                    decoration:BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Text1,

                      )
                    ) ,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 346,
                          decoration: BoxDecoration(
                            color: Text1,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                             topLeft: Radius.circular(15)
                            ),
                          ),
                          child: Center(
                            child: Text(

                                "ORDER SUMMARY",style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,

                            )),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                            itemCount: value.cartlist.length,
                            itemBuilder: (context,index)
                            {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  value.cartlist[index].Name + " x " +value.cartlist[index].qty.toString(),style: TextStyle(
                                  color: Text1,fontSize: 16,fontWeight: FontWeight.w500,

                                ),),

                                Text(
                                  value.cartlist[index].TotalPrice,style: TextStyle(
                                  color: Text1,fontSize: 16,fontWeight: FontWeight.w500,

                                ),),
                              ],
                            ),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style: TextStyle(
                            color: Text1,fontSize: 18,fontWeight: FontWeight.bold,

                          ),),

                          Text(value.calculateTotalPrice().toStringAsFixed(2),style: TextStyle(
                            color: Text1,fontSize: 18,fontWeight: FontWeight.bold,

                          ),),
                        ],
                      ),
                    ),



                      ],
                    ),

                  );
                }
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contex) => Deliverydetailspage(userId: userId,)));
                  },
                  child: btn(Text1, "Checkout", Colors.brown, 340, 40, 18,
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
