import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Thankyoupage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';

class Advancepayment extends StatelessWidget {
  String from;
  String oldid;
   Advancepayment({super.key,required this.from, required this.oldid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget btn(Color myColor, String text, Color textmycolor, double width,double height,double fonsize,FontWeight fntw) {
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
                    fontSize: fonsize, fontWeight:fntw, color: textmycolor),
              )),
        ),
      );
    }
    return Scaffold(
      backgroundColor: white,
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor:Text1,

          leading: Icon(Icons.arrow_back,color: Colors.white,
              size: 26),

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            Padding(
              padding: const EdgeInsets.only(top: 20,),
              child: Text("Advance Payment",style: TextStyle(
                color: Text1,
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),),
            ),
            SizedBox(
              height: 480,
            ),
            Center(child: Consumer<mainProvider>(
              builder: (context,value,child) {
                return InkWell(
                    onTap: () {
                      value.getBooking("");
                      Navigator.push(
                          context, MaterialPageRoute(builder: (contex) => Thankyoupage()));
                    },
                    child: btn(Text1, "Book your slot", Colors.white, 200,40,18,FontWeight.w500));
              }
            )),
          ],
        ),
      ),
    );
  }
}
