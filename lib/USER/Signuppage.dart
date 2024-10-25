import 'package:brown_lines/CONSTANT/Colors.dart';
import 'package:brown_lines/PROVIDER/loginProvider.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Homepage.dart';
import 'package:brown_lines/USER/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

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
      backgroundColor: brown1,
      body: SingleChildScrollView(
        child: Consumer<mainProvider>(
          builder: (context,value,child) {
            return Column(
              children: [
                Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Image(image: AssetImage("assets/Logoooo.PNG"),
                        height: 140,
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Text("Create Your Account",style: TextStyle(
                    color: Text1,
                    fontSize: 20,
                    fontFamily: "cabin",
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Text1))),
                  margin: EdgeInsets.only(left: 30,right: 30),
                  child: TextField(maxLines: 1,

                    controller: value.usernameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,

                        contentPadding: EdgeInsets.symmetric(horizontal: 108),
                        hintText: "Username",
                        hintStyle: TextStyle(
                          fontFamily: "cabin",
                          color: Text1,fontSize: 18,

                        )

                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Text1))),
                  margin: EdgeInsets.only(left: 30,right: 30),
                  child: TextField(maxLines: 1,

                    controller: value.usernumberController,
                    decoration: InputDecoration(
                        border: InputBorder.none,

                        contentPadding: EdgeInsets.symmetric(horizontal: 86),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          fontFamily: "cabin",
                          color: Text1,fontSize: 18,

                        )

                    ),
                  ),
                ),
                  SizedBox(height: 20,),

                InkWell(
                    onTap: () {
                      value.addUser();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (contex) => Loginpage()));
                    },
                    child: btn(Text1, "Create", Colors.white, 150,50,20,FontWeight.w500)),
                SizedBox(height: 35,),
                Padding(
                  padding: const EdgeInsets.only(left:58 ),
                  child: Row(
                    children: [
                      Text("Already have an account?  ",style: TextStyle(
                        fontSize: 16,
                        fontFamily: "cabin",
                        color: Text1,

                      ),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (contex) => Loginpage()));
                        },
                        child: Text("Login ",style: TextStyle(
                            fontSize: 16,
                            fontFamily: "cabin",
                            color: Text1,
                            fontWeight: FontWeight.w500

                        ),),
                      ),
                    ],
                  ),
                )

              ],
            );
          }
        ),
      ),
    );
  }
}
