import 'package:flutter/material.dart';

import '../CONSTANT/Colors.dart';
import 'Bookeduserdetails.dart';

class Productorders2 extends StatelessWidget {
  const Productorders2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(


          backgroundColor: brown3,
          title: Text(
              "Product Order 2",
              style: TextStyle(
                  fontFamily: "cabin",
                  color: Text1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

                  Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Text1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Beginners Kit ",
                                style: TextStyle(
                                  color: Text1,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Qty: 1",
                                style: TextStyle(
                                  color: Text1,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 130,),
                              Text(
                                "₹ 300",
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
                                "Sealant Spray",
                                style: TextStyle(
                                  color: Text1,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Qty: 1",
                                style: TextStyle(
                                  color: Text1,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 130,),
                              Text(
                                "₹ 300",
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
                  )
                ]
            ),
      ),


    );
  }
}
