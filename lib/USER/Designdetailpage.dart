import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import 'CalendarPage.dart';
import 'Userclientdetails.dart';

class Designdetailpage extends StatelessWidget {
  String itemId;
  String category;
  String descriprtion;
  String photo;
  String userId;
  Designdetailpage({
    super.key,
    required this.itemId,
    required this.category,
    required this.photo,
    required this.descriprtion,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget btn(Color myColor, String text, Color textmycolor, double width,
        double height, double fonsize, FontWeight fntw) {
      return Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
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
      backgroundColor: brown3,
      body: Column(
        children: [
          SizedBox(
            height: 480,
            child: Stack(children: [
              Consumer<mainProvider>(builder: (context, value, child) {
                return Column(
                  children: [
                    Container(
                      height: 450,
                      width: 500,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(photo), fit: BoxFit.fill),
                      ),
                    ),
                  ],
                );
              }),
              Positioned(
                  bottom: 10,
                  child: Container(
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Text1,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Center(
                      child: Text(category,
                          style: TextStyle(
                              color: brown1,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: "cabin")),
                    ),
                  )),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  descriprtion,
                  style: TextStyle(
                    fontFamily: "cabin",
                    fontSize: 12,
                    color: Text1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 110),
                  child: Consumer<mainProvider>(
                    builder: (context,val,child) {
                      return InkWell(
                          onTap: () {
                            val.getBooking(userId);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (contex) => Userclientdetails(userId: userId, from: '', model:category,)));
                            // Navigator.push(context, MaterialPageRoute(builder: (contex) => CalendarPage(from: '', oldid: '',)));
                          },
                          child: btn(Text1, "Book Now", Colors.white, 150, 40, 18,
                              FontWeight.w500));
                    }
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
