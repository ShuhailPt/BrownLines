import 'package:brown_lines/CONSTANT/Colors.dart';
import 'package:brown_lines/USER/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/loginProvider.dart';

class Otppage extends StatelessWidget {
   Otppage({super.key});

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: brown3,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Image(
                  image: AssetImage("assets/Logoooo.PNG"),
                  height: 140,
                ),
              )),
              SizedBox(
                height: 30,
              ),
              Text(
                "Enter OTP",
                style: TextStyle(
                    color: Text1,
                    fontSize: 20,
                    fontFamily: "cabin",
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              Consumer<loginprovider>(builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                  child: Pinput(
                    controller:value.otpverifycontroller,
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    defaultPinTheme: PinTheme(
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.transparent,
                                blurRadius: 2.0, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 2,
                              color: Text1,
                            ))),

                    onCompleted: (pin) {
                      print("jffhi");
                      value.verify(context);
                    },
                  ),
                );
              }),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (contex) => Homepage(userId: userId,)));
                  },
                  child: btn(Text1, "Submit", Colors.white, 150, 50, 20,
                      FontWeight.w500)),
              SizedBox(
                height: 20,
              ),
              Text(
                "Resend OTP in: 30sec",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "cabin",
                  color: Text1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
