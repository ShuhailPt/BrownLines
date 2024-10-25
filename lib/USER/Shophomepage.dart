import 'package:brown_lines/MODELCLASS/modelclass.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Advertisementdettails.dart';
import 'package:brown_lines/USER/Cartpage.dart';
import 'package:brown_lines/USER/Productdetailpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/Colors.dart';
import '../CONSTANT/Colors.dart';
import '../CONSTANT/Colors.dart';
import '../CONSTANT/Colors.dart';
import '../CONSTANT/Colors.dart';

class Shophomepage extends StatelessWidget {

  String Userid;

  Shophomepage({super.key,required this.Userid});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: brown3,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          shape: Border(
            bottom: BorderSide(width: 2, color: Text1),
          ),
          backgroundColor: brown3,
          title: Text("BROWN LINES",
              style: TextStyle(
                  fontFamily: "iceland",
                  color: Text1,
                  fontSize: 30,
                  fontWeight: FontWeight.w500)),
          centerTitle: true,
          actions: [
            Consumer<mainProvider>(
              builder: (context,provider,child) {
                return InkWell(
                    onTap: () {
                      provider.getCartDetails(Userid);
                      Navigator.push(context, MaterialPageRoute(builder: (contex) => Cartpage(userId:Userid ,

                              )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Icon(CupertinoIcons.bag,color: Text1,),
                    ));
              }
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: value.advtlist.length,
                      itemBuilder: (BuildContext context, int index) {

                       return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<mainProvider>(
                                builder: (context, value, child) {

                                  AdvtModel advertisement = value.advtlist[index];
                                  return InkWell(
                                    onTap: () {
                                      value.getAdvtImage();
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (contex) =>
                                              Advertisementdettails(
                                                itemId: advertisement.id,
                                                name: advertisement.Name,
                                                price: advertisement.Price,
                                                photo: advertisement.Photo,
                                                desciprtion: advertisement.Description, userId: Userid,)));
                                    },
                                    child: Container(
                                      height: 120,
                                      width: 600,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Text1, width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                value.advtlist[index].Photo
                                                    .toString()), fit: BoxFit.fill),),
                                    ),
                                  );
                                }
                            ),
                          ],
                        );
                      }
                    ),
                  );
                }
              ),
              SizedBox(
                height: 10,
              ),
              Text(

                "Products",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Text1,

              ),),
              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: value.productlist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<mainProvider>(
                            builder: (context,value,child) {
                              ProductModel product = value.productlist[index];
                              return InkWell(
                                onTap: () {
                                  value.getProductImage();
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (contex) => Productdetailpage(
                                          itemId: product.id,
                                        name: product.Name,
                                          price: product.Price,
                                          photo: product.Photo,
                                          desciprtion: product.Prodescription,
                                          Userid:Userid)));
                                  print(product.Name);
                                },
                                child: Container(
                                  height: 125,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(value.productlist[index].Photo.toString()),fit: BoxFit.fill),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                     ),
                                ),
                              );
                            }
                          ),

                      Text(
                      value.productlist[index].Name,
                        style: TextStyle(
                          fontSize: 14,
                          color:Text1,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                          Text("₹"+
                            value.productlist[index].Price,
                            style: TextStyle(
                              fontSize: 14,
                              color:Text1,
                              fontWeight: FontWeight.w500
                            ),
                          ),

                        ],
                      );


                    },
                  );
                }
              ),

            ],
          ),
        ),
      ),
    );
  }
}
