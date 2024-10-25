import 'package:brown_lines/USER/Chatbox.dart';
import 'package:brown_lines/USER/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../CONSTANT/Colors.dart';

class Messagespage extends StatefulWidget {
  String userId;
  Messagespage({super.key,required this.userId});

  @override
  State<Messagespage> createState() => _MessagespageState();
}

class _MessagespageState extends State<Messagespage>
    with SingleTickerProviderStateMixin
{
  late TabController controller;
  PageController pageController=PageController(
      initialPage: 0
  );

  List<String> images = [
    "assets/img_10.png",
    "assets/img_10.png",
    "assets/img_10.png",
    "assets/img_10.png",
    "assets/img_10.png",
    "assets/img_10.png",

  ];
  List<String> statusimg = [
    "assets/img_7.png",
    "assets/img_7.png",
    "assets/img_7.png",
    "assets/img_7.png",
    "assets/img_7.png",
    "assets/img_7.png",
    "assets/img_7.png",
    "assets/img_7.png",
    "assets/img_7.png",
    "assets/img_7.png",
    "assets/img_7.png",
  ];
  List<String> title = [
    "Dilsha",
    "Shahna",
    "Dilsha",
    "Dilsha",
    "Dilsha",
    "Dilsha",
    "Dilsha",
    "Dilsha","Dilsha","Dilsha","Dilsha",
  ];

  @override
  void initState(){
    controller=TabController(length: 4, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: brown3,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor:Text1,
         leading: Padding(
           padding: const EdgeInsets.only(left: 10),
           child: Row(
             children: [
               InkWell(
                 onTap: () {
                   Navigator.push(context,
                       MaterialPageRoute(builder: (contex) => Homepage(userId: widget.userId,)));
                 },
                 child: Icon(Icons.arrow_back,color: Colors.white,
                     size: 26),
               ),
               Text("Messages",style: TextStyle(
                 color: Colors.white,fontSize: 22,
                 fontWeight: FontWeight.w400,

               )),
             ],
           ),
         ),


        ),
      ),
      body: PageView(

          children: [

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                topLeft: Radius.circular(20))
              ),
              child:  Column(
                children: [
                  SizedBox(height: 20,),
                  Center(
                    child: Container(
                      height: 46,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Text1, width: 2)),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index) {

                        return Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (contex) => Chatbox(userId: widget.userId,)));
                            },
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Text1,width: 1
                                      )
                                  )
                              ),
                              child: ListTile(contentPadding: EdgeInsets.only(left: 1,),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(images[index]),

                                ),
                                title: Text(title[index],style: TextStyle(
                                    color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18
                                )),
                                subtitle: Text('hey',style: TextStyle(
                                    fontSize: 16
                                )),
                                trailing: Text('10:30 AM'),

                              ),
                            ),
                          ),

                        );



                      },
                    ),
                  ),

                ],
              ),
            ),





            //
            //
            //

          ]
      ),

    );
  }
}
