import 'package:brown_lines/CONSTANT/Colors.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/CalendarPage.dart';
import 'package:brown_lines/USER/Feedpage.dart';
import 'package:brown_lines/USER/Homepage.dart';
import 'package:brown_lines/USER/Shophomepage.dart';
import 'package:brown_lines/USER/Userprofilepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Userclientdetails.dart';

class bottomnavigation extends StatefulWidget {
  final String  Userid;
  final String  Username;
  final String  Usernumber;
  const bottomnavigation({super.key, required this.Userid,required this.Username,required this.Usernumber});

  @override
  State<bottomnavigation> createState() => _bottomnavigationState();
}

class _bottomnavigationState extends State<bottomnavigation> {
  int selectedindex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Make the initial API calls after the first frame is built
      Provider.of<mainProvider>(context, listen: false).getPostImage();
    });
  }

  void onicontapped(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print("Selected index: " + selectedindex.toString());
    final pages = [
      Homepage(userId: widget.Userid,),
      Userclientdetails(userId: widget.Userid, from: 'Home', model: '',),
      Shophomepage(Userid: widget.Userid,),
      Userprofilepage(userId: widget.Userid, userName: widget.Username, userNumber:widget.Usernumber,),
    ];
    return Scaffold(
      extendBody: true,
      body: pages[selectedindex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color:brown3,
              border:
              Border(top: BorderSide(color: Color(0xff876c34), width: 2))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return IconButton(
                      onPressed: () {
                        value.getFeedImage();

                        onicontapped(0);
                        Provider.of<mainProvider>(context, listen: false)
                            .getPostImage();
                      },
                      icon: selectedindex == 0
                          ? Icon(
                        Icons.home_filled,
                        color: Text1,
                      )
                          : Icon(Icons.home_filled),color: brown2,);
                }
              ),
              Consumer<mainProvider>(
                builder: (context,value,child) {
                  return IconButton(
                      onPressed: () {
                        value.getBooking(widget.Userid);
                        onicontapped(1);
                      },
                      icon: selectedindex == 1
                          ? Icon(
                        Icons.calendar_today,
                        color: Text1,
                      )
                          : Icon(Icons.calendar_today),color: brown2,);
                }
              ),
              Consumer<mainProvider>(builder: (context, value, child) {
                return IconButton(
                    onPressed: () {
                      value.getProductImage();
                      value.getAdvtImage();

                      onicontapped(2);
                    },
                    icon: selectedindex == 2
                        ? Icon(
                      Icons.shopping_bag_rounded,
                      color: Text1,
                    )
                        : Icon(Icons.shopping_bag_rounded),color: brown2,);
              }),
              IconButton(
                  onPressed: () {
                    onicontapped(3);
                  },
                  icon: selectedindex == 3
                      ? Icon(Icons.person_rounded,
                      color: Text1)
                      : Icon(Icons.person_rounded),color: brown2,)
            ],
          ),
        ),
      ),
    );
  }
}
