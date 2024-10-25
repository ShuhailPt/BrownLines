import 'package:flutter/material.dart';

import '../CONSTANT/Colors.dart';

class Thankyoupage extends StatelessWidget {
  const Thankyoupage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
         Container(
           height: 160,
           width: 500,
           decoration: BoxDecoration(
             border: Border(bottom: BorderSide(color: Text1)),
           ),
           child: Image(
               image: AssetImage("assets/img.png"),height: 50),
         ),
SizedBox(
  height: 180,
),
          Text(textAlign: TextAlign.center,
            "THANK YOU, AYSHA K\nYOUR DATE IS BLOCKED",style: TextStyle(
            color: Text1,
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 10,),
          Text(


            textAlign: TextAlign.center,
            "You will raceive a cofirmation email soon",style: TextStyle(
            color: Text1,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),),
          // SizedBox(height: 10,),
          // Divider(
          //   height: 1,
          //   color: Text1,
          //   endIndent: 20,
          //   indent: 20,
          // )
        ],
      ),

    );
  }
}
