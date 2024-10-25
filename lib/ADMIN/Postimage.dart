import 'package:brown_lines/ADMIN/Addpostimage.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';

class Postimage extends StatelessWidget {
  String from;
  String oldid;
  Postimage({super.key,required this.from,required this.oldid});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Consumer<mainProvider>(
        builder: (context,value,child) {
          return FloatingActionButton(
            shape: CircleBorder(side: BorderSide(color: brown4)),
            backgroundColor: white,
            onPressed: () {
            value.clearPostImage();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Addpostimage(from: "NEW", oldid: "",)));
            },
            child: Icon(Icons.add,color: brown4,),
          );
        }
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: brown3,
          title: Text(
              "Add post "
                  "image",
              style: TextStyle(
                  fontFamily: "cabin",
                  color: Text1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,

        ),
      ),
body: Padding(
  padding: const EdgeInsets.all(8.0),
  child: SingleChildScrollView(
    child: Column(
      children: [
        Consumer<mainProvider>(
            builder: (context,value,child) {
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                // padding: EdgeInsets.only(right: 10, top: 10,left: 5),
                itemCount: value.postlist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent:200,
                  crossAxisSpacing: 20


                ),
                itemBuilder: (context, index) {
                  print("ahbdhsd"+value.postlist.length.toString());
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content:  Text(
                              "Do you want to  EDIT or DELETE ?",style: TextStyle(
                              fontSize:17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                          actions: <Widget>[
                            Center(
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      value.DeletePostImage(
                                          value.postlist[index].id,context);
                                      Navigator.of(context).pop();

                                    },
                                    child: Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:Colors.red ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  Text("Delete",style: TextStyle(
                                        color:white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,

                                      ))),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      print("hjjk"+ value.postlist[index].id);
                                      value.EditPostImage(
                                          value.postlist[index].id);
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Postimage(
                                                    from: "EDIT",
                                                    oldid: value.postlist[index].id
                                                ),
                                          ));
                                    },
                                    child:Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:brown4 ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  Text("Edit",style: TextStyle(
                                        color:Colors.white,
                                        fontSize: 17,fontWeight: FontWeight.w600,
                                      ))),
                                    ),)
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                              height: height/5.5,
                              width: width/2.4,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(value.postlist[index].Photo.toString()),fit: BoxFit.fill
                                  ),
                                  borderRadius: BorderRadius.circular(5)

                              ),
                            ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(value.postlist[index].Category,style: TextStyle(fontSize: 14,color: Text1),),
                        Text(value.postlist[index].Description,style: TextStyle(
                            fontSize: 14,color: Text1
                        ),)
                      ],
                    ),


                  );

                },
              );
            }
        ),
        SizedBox(height: 10,),
        // Consumer<mainProvider>(
        //   builder: (context,value,child) {
        //     return Container(
        //       height: 350,
        //       width: 500,
        //       decoration: BoxDecoration(
        //           color: brown3,
        //           borderRadius: BorderRadius.all(Radius.circular(18))
        //       ),
        //     );
        //   }
        // ),
        // SizedBox(height: 10,),
        //   Consumer<mainProvider>(
        //     builder: (context,value,child) {
        //       return Container(
        //           height: 50,
        //           width: 340,
        //           decoration: BoxDecoration(
        //               border: Border.all(color: Text1)
        //           ),
        //           child:TextFormField(
        //             decoration: InputDecoration(
        //                 border: InputBorder.none,
        //                 contentPadding: EdgeInsets.symmetric(horizontal: 10),
        //                 hintText: "",
        //                 hintStyle: TextStyle(
        //                     color: Text1
        //                 )
        //
        //             ),
        //           ),
        //       );
        //     }
        //   ),
        // SizedBox(height: 10,),
        //   Consumer<mainProvider>(
        //     builder: (context,value,child) {
        //       return Container(
        //           height: 50,
        //           width: 340,
        //           decoration: BoxDecoration(
        //               border: Border.all(color: Text1)
        //           ),
        //           child:TextFormField(
        //             decoration: InputDecoration(
        //                 border: InputBorder.none,
        //                 contentPadding: EdgeInsets.symmetric(horizontal: 10),
        //                 hintText: "",
        //                 hintStyle: TextStyle(
        //                     color: Text1
        //                 )
        //
        //             ),
        //           )
        //       );
        //     }
        //   ),

      ],
    ),
  ),
),
    );
  }
}
