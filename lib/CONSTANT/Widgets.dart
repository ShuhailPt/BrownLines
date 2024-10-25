
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

Widget (BuildContext context) {
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
}