import 'package:brown_lines/ADMIN/AddAdvertisement.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import '../PROVIDER/mainProvider.dart';

class Advertisement2 extends StatelessWidget {
  String from;
  String oldid;
  Advertisement2({super.key,required this.from,required this.oldid});

  get height => null;
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
                value.clearAdvtImage();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Addadvertisement(from: "NEW", oldid: ' ')));
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
              "Advertisement",
              style: TextStyle(
                  fontFamily: "cabin",
                  color: Text1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,

        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10,),
        Consumer<mainProvider>(
          builder: (context,value,child) {
            return ListView.builder(
        padding: EdgeInsets.only(bottom: 10),
        shrinkWrap: true,
          itemCount:  value.advtlist.length,
          physics: ScrollPhysics(),
        
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content:  Text(
                      "Do you want to  EDIT or DELETE ?",style: TextStyle(
                      fontSize:17,
                      fontFamily: "kadwa",
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
                  actions: <Widget>[
                    Center(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              value.DeleteAdvtImage(
                                  value.advtlist[index].id,context);
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
                                fontFamily: "kadwa",
                              ))),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              print("hjjk"+ value.advtlist[index].id);
                              value.EditAdvtImage(
                                  value.advtlist[index].id);
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Addadvertisement(
                                            from: "EDIT",
                                            oldid: value.advtlist[index].id
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
                  height: 140,
                  width: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(value.advtlist[index].Photo.toString()),fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.circular(5)

                  ),
                ),
                SizedBox(height: 10,),
                Container(
                    height: 50,
                    width: 330,
                    decoration: BoxDecoration(
                        border: Border.all(

                            color: Text1
                        )
                    ),
                    child: Text(value.advtlist[index].Name,style: TextStyle(fontSize: 14,color: Text1),)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 330,
                  decoration: BoxDecoration(
                      border: Border.all(

                          color: Text1
                      )
                  ),
                  child: Text(value.advtlist[index].Price,style: TextStyle(
                      fontSize: 14,color: Text1
                  ),),
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  height: height/5.5,
                  width: width/1,
                  decoration: BoxDecoration(
                      border: Border.all(color: Text1,)
                  ),
                  child:Text(value.advtlist[index].Description,style: TextStyle(fontSize: 14,color: Text1),),
                ),
                SizedBox(
                  height: 20,
                ),


              ],
            ),
        
        
          );
        
        },
            );
          }
        )

            ],
          ),
        ),
      ),
    );
  }

}
