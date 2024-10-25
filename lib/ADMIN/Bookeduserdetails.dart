import 'package:flutter/material.dart';

import '../CONSTANT/Colors.dart';

class Bookeduserdetails extends StatelessWidget {
   Bookeduserdetails({super.key});
  List<String> Username = [
    "Dilsha.M",
    "Shahna",
    "Jeleesha.k",
  ];
  List<String> Name = [
    "Name:",
    "Name:",
    "Name:",
  ];
  List<String> NumberList = [
    "8138765543", "8138765543", "8138765543",

  ];
  List<String> Phonenumber = [
    "Phone Number:", "Phone Number:", "Phone Number:",

  ];


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
            color: brown3,
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(


          backgroundColor: brown3,
          title: Text(
              "Booked Users Details",
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
ListView.builder(itemBuilder: (context,index){
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
                          Name[index],
                          style: TextStyle(
                            color: Text1,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          Username[index],
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
                          Phonenumber[index],
                          style: TextStyle(
                            color: Text1,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          NumberList[index],
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
