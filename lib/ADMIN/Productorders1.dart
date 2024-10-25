import 'package:flutter/material.dart';

import '../CONSTANT/Colors.dart';
import 'Bookeduserdetails.dart';

class Products extends StatelessWidget {
   Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(


          backgroundColor: brown3,
          title: Text(
              "Product Orders 1",
              style: TextStyle(
                  fontFamily: "cabin",
                  color: Text1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,

        ),
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount:3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    height: 85,
                    child: Stack(

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
                          ),
                          Positioned(
                            top: 55,
                            left: 266,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (contex) => Bookeduserdetails()));
                              },
                              child: Container(height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Text1,
                                    borderRadius: BorderRadius.all(Radius.circular(30),)
                                ),
                                child: Center(
                                  child: Text("Open",style: TextStyle(
                                      color: Colors.white,fontSize: 12
                                  )),
                                ),
                              ),
                            ),
                          )
                        ]
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
