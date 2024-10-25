import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import '../MODELCLASS/modelclass.dart';
import 'Cartpage.dart';

class Advertisementdettails extends StatelessWidget {
  String itemId;
  String name;
  String price;
  String desciprtion;
  String photo;
  String userId;
   Advertisementdettails({super.key,
     required this.itemId,
     required this.name,
     required this.price,
     required this.photo,
     required this.desciprtion,
     required this.userId,
   });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget btn(Color myColor, String text, Color textmycolor, double width,
        double height, double fonsize, FontWeight fntw) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child:
        Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 380,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                image: DecorationImage(
                    image: NetworkImage(photo),fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                   "Bundle(Pack of 100 sheets)",
                    style: TextStyle(
                      color: Text1,
                      fontSize: 14,

                    ),
                  ),
                  // Text(
                  //   "Quantity",
                  //   style: TextStyle(
                  //     color: Text1,
                  //     fontSize: 14,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   height: 50,
                  //   width: 100,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: Text1,
                  //       )),
                  //   child: TextField(
                  //
                  //     decoration: InputDecoration(border: InputBorder.none,),
                  //   ),
                  // ),
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
                    height: 120,
                  ),
                  Center(
                    child: btn(Text1, "Add to bag", Colors.brown, 300, 40, 20,
                        FontWeight.w500),
                  ),
                  Center(
                    child: Consumer<mainProvider>(
                      builder: (context,value,child) {
                        return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
    itemCount: value.feedlist.length,
    itemBuilder: (BuildContext context, int index) {
      ProductModel product = value.productlist[index];
      return InkWell(
        onTap: () {
          value.getProductImage();

          Navigator.push(
              context, MaterialPageRoute(builder: (contex) =>
              Cartpage(userId: userId,)));
        },
        child: Container(
          height: 40,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
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
                        );
                      }
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
