import 'package:brown_lines/CONSTANT/Colors.dart';
import 'package:brown_lines/PROVIDER/loginProvider.dart';
import 'package:brown_lines/USER/Otppage.dart';
import 'package:brown_lines/USER/Signuppage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

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
          child: Consumer<loginprovider>(
            builder: (context,value,child) {
              return Column(
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
                    "Login To Your Account",
                    style: TextStyle(
                        color: Text1,
                        fontSize: 20,
                        fontFamily: "cabin",
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Text1))),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: value.Loginphnnumber,
                        maxLines: 1,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 86),
                            hintText: "Phone Number",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontFamily: "cabin",
                              color: Text1,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        value.sendotp(context,);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (contex) => Otppage()));
                      },
                      child: Center(child: btn(Text1, "Get OTP", Colors.white, 150, 50, 20, FontWeight.w500))),
                  SizedBox(
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 54),
                    child: Row(
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "cabin",
                            color: Text1,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (contex) => Signuppage()));
                          },
                          child: Text(
                            "Sign Up ",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "cabin",
                                color: Text1,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
