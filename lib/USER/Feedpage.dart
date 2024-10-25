import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import '../MODELCLASS/modelclass.dart';
import 'Designdetailpage.dart';

class Feedpage extends StatelessWidget {
  String userId;
  Feedpage({
    super.key,required this.userId
  });
  List<String> img = [
    "assets/IMG_6080.jpg",
    "assets/IMG_6296.jpg",
    "assets/IMG_6080.jpg",
    "assets/IMG_6296.jpg",
    "assets/IMG_9201.JPG",
    "assets/IMG_6296.jpg",
    "assets/IMG_6296.jpg",
    "assets/IMG_9201.JPG",
    "assets/a665325b-c3e9-4821-aa5c-3dc9a6ee09da.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(width: 2, color: Text1),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Text1)),
        backgroundColor: brown3,
        title: Text("BROWN LINES",
            style: TextStyle(
                fontFamily: "iceland",
                color: Text1,
                fontSize: 30,
                fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      backgroundColor: brown3,
      body: SingleChildScrollView(
        child: Consumer<mainProvider>(builder: (context, value, child) {
          return ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: value.feedlist.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Consumer<mainProvider>(
                            builder: (context, value, child) {
                          value.getFeedImage();
                          return Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      value.feedlist[index].Photo.toString()),
                                  fit: BoxFit.fill),
                            ),
                          );
                        }),
                      ),
                    ),
                    Text(
                      value.feedlist[index].Name,
                      style: TextStyle(
                          color: Text1,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: "cabin"),
                    ),
                    Text(
                      "MEHENDI ARTIST",
                      style: TextStyle(
                          color: Text1,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 84),
                      child: Row(
                        children: [
                          Text(
                            value.feedlist[index].Link,
                            style: TextStyle(
                                color: Text1,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Image(
                            image: AssetImage("assets/instagramicon.png"),
                            height: 20,
                          )
                        ],
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      value.feedlist[index].Description,
                      style: TextStyle(
                        color: Text1,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Consumer<mainProvider>(builder: (context, value, child) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: value.postlist.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 0.98,
                          childAspectRatio: 0.95,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Consumer<mainProvider>(
                              builder: (context, value, child) {
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
                                              descriprtion: post.Description, userId: userId,
                                            )));
                              },
                              child: Container(
                                height: 100,
                                width: 300,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(value
                                            .postlist[index].Photo
                                            .toString()),
                                        fit: BoxFit.fill),
                                    border: Border.all(
                                      color: Text1,
                                    )),
                              ),
                            );
                          });
                        },
                      );
                    }),
                  ],
                );
              });
        }),
      ),
    );
  }
}
