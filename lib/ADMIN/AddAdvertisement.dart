import 'package:brown_lines/ADMIN/Advertisement2.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';

class Addadvertisement extends StatelessWidget {
  String from;
  String oldid;
  Addadvertisement({super.key,required this.from,required this.oldid});


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
              "Advertisement 1",
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
              SizedBox(height: 10,),
          
              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: () {
                      showBottomSheet(context);
                    },
                    child:value.advtFileImage!=null?Container(
                      height: 140,
                      width: 500,
                      decoration: BoxDecoration(
                          color: brown3,
                          borderRadius: BorderRadius.all(Radius.circular(18))
                      ),
                  child: Center(child: Image(image: FileImage(value.advtFileImage!),fit:BoxFit.fill ,
                      ),
                    ),
                  ) :Container(
                  height: 140,
                  width: 500,
                  decoration: BoxDecoration(
                  color: brown3,
                  borderRadius: BorderRadius.all(Radius.circular(18))
                  ),
                  child: Center(child: Image(image: AssetImage("assets/img_20.png"),
                    fit: BoxFit.fill,height: 30,),
                  ),
                  ),
                  );
                }
              ),
              SizedBox(height:10,),
              Consumer<mainProvider>(
                  builder: (context,value,child) {
                    return Container(
                        height: 50,
                        width: 340,
                        decoration: BoxDecoration(
                            border: Border.all(color: Text1)
                        ),
                        child:TextFormField(
                          controller: value.advtnameCt,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              hintText: "Category",
                              hintStyle: TextStyle(
                                  color: Text1
                              )
          
                          ),
                        )
                    );
                  }
              ),
              SizedBox(height: 10,),
              Consumer<mainProvider>(
                  builder: (context,value,child) {
                    return Container(
                        height: 50,
                        width: 340,
                        decoration: BoxDecoration(
                            border: Border.all(color: Text1)
                        ),
                        child:TextFormField(
                          controller: value.advtpricedetailsCt,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              hintText: "Price and Details",
                              hintStyle: TextStyle(
                                  color: Text1
                              )
          
                          ),
                        )
                    );
                  }
              ),
              SizedBox(height: 10,),
              Consumer<mainProvider>(
                  builder: (context,value,child) {
                    return Container(
                        height: 200,
                        width: 340,
                        decoration: BoxDecoration(
                            border: Border.all(color: Text1)
                        ),
                        child:TextFormField(
                          controller: value.advtprodescriptionCt,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              hintText: "Product Description",
                              hintStyle: TextStyle(
                                  color: Text1
                              )
          
                          ),
                        )
                    );
                  }
              ),
          
              SizedBox(height: 20,),
          
              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return InkWell(
                      onTap: () {
          
                        print(from);
                        if ( from == "NEW"){
                          value.addAdvtImage(from, "");
                        }else{
                          value.addAdvtImage(from,oldid);
                        }
                        Navigator.push(context,
                            MaterialPageRoute(builder: (contex) => Advertisement2(from:"NEW" ,oldid: "",)));
                      },
                      child: btn(Text1, "Upload", Text1, 200,40,16,FontWeight.w500));
                }
              )
            ],
          ),
        ),
      ),

    );
  }
  void showBottomSheet(BuildContext context) {
    mainProvider provider =Provider.of<mainProvider>(context,listen:false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color: Text1,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {provider.getAdvtImgcamera(), Navigator.pop(context)}),
              ListTile(
                  leading:  Icon(Icons.photo, color: Text1),
                  title: const Text('Gallery',),
                  onTap: () => {
                    provider.getAdvtImggallery(),
                    // Navigator.pop(context)
                  }

              ),
            ],
          );
        });
    // ImageSource
  }

}
