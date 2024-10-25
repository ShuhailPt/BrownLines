import 'package:brown_lines/USER/Messagespage.dart';
import 'package:flutter/material.dart';

import '../CONSTANT/Colors.dart';

class Chatbox extends StatelessWidget {
  String userId;
   Chatbox({super.key,required this.userId});
   
  List<String> images = [

    "assets/img_10.png",
    "assets/img_10.png",
    "assets/img_10.png",
    "assets/img_10.png",
    "assets/img_10.png",
    "assets/img_10.png",

  ];
   List<String> Texts = [
     "Hey",
     "Hello",
     "Hey",
     "Hello",
     "Hey",
     "Hello",
     "Hey",
     "Hello",

   ];



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor:Text1,

         leading: Padding(
           padding: const EdgeInsets.all(10),
           child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contex) => Messagespage(userId: userId,)));
                  },
                  child: Icon(Icons.arrow_back,color: Colors.white,
                      size: 26),
                ),
                SizedBox(
                  width: 10,

                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/img_10.png"),

                ),
                SizedBox(
                  width: 10,

                ),

                Text("Akarsha",style: TextStyle(
                  color: Colors.white,fontSize: 18,
                  fontWeight: FontWeight.w400,

                )),
              ],
            ),
         ),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: brown2,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                  color: Text1,fontSize: 16
                ),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: brown3,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                  color: Text1,fontSize: 16
                ),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: brown2,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                  color: Text1,fontSize: 16
                ),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Container(
                height: 50,
                width: 240,
                decoration: BoxDecoration(
                    color: brown3,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                  color: Text1,fontSize: 16
                ),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: brown2,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                  color: Text1,fontSize: 16
                ),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Container(
                height: 50,
                width: 240,
                decoration: BoxDecoration(
                    color: brown3,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                    color: Text1,fontSize: 16
                ),)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: brown2,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                    color: Text1,fontSize: 16
                ),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Container(
                height: 50,
                width: 240,
                decoration: BoxDecoration(
                    color: brown3,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                    color: Text1,fontSize: 16
                ),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Container(
                height: 50,
                width: 240,
                decoration: BoxDecoration(
                    color: brown2,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                    color: Text1,fontSize: 16
                ),)),
              ),
            ),Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Container(
                height: 50,
                width: 240,
                decoration: BoxDecoration(
                    color: brown3,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                    color: Text1,fontSize: 16
                ),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Container(
                height: 50,
                width: 240,
                decoration: BoxDecoration(
                    color: brown2,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                    color: Text1,fontSize: 16
                ),)),
              ),
            ),Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Container(
                height: 50,
                width: 240,
                decoration: BoxDecoration(
                    color: brown3,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Text("Hey",style: TextStyle(
                    color: Text1,fontSize: 16
                ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
