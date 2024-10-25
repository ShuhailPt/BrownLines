import 'package:flutter/material.dart';

import '../CONSTANT/Colors.dart';

class Thankyoupage2 extends StatelessWidget {
  const Thankyoupage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

body: Column(
  children: [
    Container(
      height: 160,
      width: 500,
      decoration: BoxDecoration(

          border: Border(bottom: BorderSide(color: Text1,))
      ),
      child: Image(
          image: AssetImage("assets/img.png"),height: 50),
    ),
    SizedBox(
      height: 180,
    ),
    Text(textAlign: TextAlign.center,
      "THANK YOU, AYSHA K\nFOR SHOPPING WITH US",style: TextStyle(
          color: Text1,
          fontSize: 24,
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
    SizedBox(height: 10,),

  ],
),
    );
  }
}
