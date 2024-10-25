import 'package:brown_lines/CONSTANT/Colors.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Chatbox.dart';
import 'package:brown_lines/USER/Feedpage.dart';
import 'package:brown_lines/USER/Messagespage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../MODELCLASS/modelclass.dart';
import 'Designdetailpage.dart';

class Homepage extends StatelessWidget {
  String userId;
  Homepage({super.key,required this.userId});
  List<String> img = [
    "assets/IMG_6080.jpg",
    "assets/IMG_6296.jpg",
    "assets/IMG_6080.jpg",
  ];
  List<String> Caption = [
    "Rs 5000/- For both hands till elbow without travel expenses",
    "Rs 5000/- For both hands till elbow without travel expenses",
    "Rs 5000/- For both hands till elbow without travel expenses",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<mainProvider>(
            builder: (context,val,child) {
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: InkWell(
                  onTap: () async {
                    const phoneNumber = '+918139820087';
                    const url = 'tel:$phoneNumber';
                    try {
                      if (await launcher.canLaunch(url)) {
                        await launcher.launch(url);
                      } else {
                        print('Could not launch $url');
                      }
                    } on PlatformException catch (e) {
                      print('Error launching phone app: ${e.message}');
                    } catch (e) {
                      print('Unexpected error: $e');
                    }
                  },
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Text1, // Make sure Text1 is defined
                    child: Icon(Icons.phone, color: Colors.white),
                  ),
                ),
              );
            }
          )
        ],
        backgroundColor: brown3,
        title: Text("BROWN LINES",
            style: TextStyle(
                fontFamily: "iceland",
                color: Text1,
                fontSize: 30,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<mainProvider>(
              builder: (context, value, child) {
            return InkWell(
              onTap: () {
                value.getFeedImage();
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => Feedpage(userId: userId,)));
              },
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: value.feedlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                value.feedlist[index].Photo.toString()),
                            fit: BoxFit.fill),
                      ),
                    );
                  }),
            );
          }),
        ),
      ),
      backgroundColor: brown3,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 16,
          ),
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
          // SizedBox(
          //   height: 10,
          // ),
          // Container(
          //   height: 120,
          //   width: 350,
          //   decoration: BoxDecoration(
          //       border: Border.all(color: Text1, width: 2),
          //       borderRadius: BorderRadius.circular(20),
          //       image: DecorationImage(
          //           image: AssetImage("assets/img_3.png"), fit: BoxFit.fill)),
          // ),
          SizedBox(
            height: 20,
          ),
          Consumer<mainProvider>(builder: (context, value, child) {
            return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: value.postlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 480,
                    child: Stack(children: [
                      Consumer<mainProvider>(builder: (context, value, child) {
                        PostModel post = value.postlist[index];

                        return InkWell(
                          onTap: () {
                            value.getPostImage();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (contex) => Designdetailpage(
                                          itemId: post.id,
                                          category: post.Category,
                                          photo: post.Photo,
                                          descriprtion: post.Description, userId:userId ,
                                        )));
                          },
                          child: Container(
                            height: 400,
                            width: 500,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      value.postlist[index].Photo.toString()),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        );
                      }),
                      Positioned(
                          bottom: 50,
                          child: Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Text1,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30))),
                            child: Center(
                              child: Text(value.postlist[index].Category,
                                  style: TextStyle(
                                      color: brown1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "cabin")),
                            ),
                          )),
                      Positioned(
                        top: 440,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              Text(
                                value.postlist[index].Description,
                                style: TextStyle(
                                    fontFamily: "cabin",
                                    fontSize: 14,
                                    color: Text1,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  );
                });
          }),
        ]),
      ),
    );
  }
}
