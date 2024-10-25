import 'package:brown_lines/USER/Chatbox.dart';
import 'package:flutter/material.dart';

import '../CONSTANT/Colors.dart';

class Bottomnavigation2 extends StatefulWidget {
  String userId;
   Bottomnavigation2({super.key,required this.userId});

  @override
  State<Bottomnavigation2> createState() => _Bottomnavigation2State();
}

class _Bottomnavigation2State extends State<Bottomnavigation2> {
  int selectedindex = 0;
  void onicontapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print("jhbkhbfv" + selectedindex.toString());
    final pages = [Chatbox(userId: widget.userId,)];
    return Scaffold(
      extendBody: true,
      body: pages[selectedindex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Color(0xff876c34), width: 2))),
          child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Row(
              children: [
                Image(image: AssetImage("assets/img_12.png"), height: 40),
                Container(
                  height: 40,
                  width: 316,
                  decoration: BoxDecoration(
                    color: brown3,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      suffixIcon: Icon(Icons.send,size: 20,color: Text1,),
                    ),
                    
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
