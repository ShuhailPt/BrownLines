import 'package:brown_lines/ADMIN/Clientdetails.dart';
import 'package:brown_lines/CONSTANT/Colors.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Homepage.dart';
import 'package:brown_lines/USER/Userclientdetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Advancepayment.dart';
import 'Designdetailpage.dart';

class CalendarPage extends StatefulWidget {
  String from;
  String oldid;
  String userId;
  String model;
  CalendarPage({super.key,required this.from,required this.oldid,required this.userId,required this.model});
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget btn(Color myColor, String text, Color textmycolor, double width,
        double height, double fonsize, FontWeight fntw) {
      return Padding(
        padding: EdgeInsets.only(bottom: 20, top: 20, left: 5, right: 5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: brown2,
          ),
          child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fonsize, fontWeight: fntw, color: textmycolor),
              )),
        ),
      );
    }

    return Scaffold(
      backgroundColor: brown3,
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(width: 2, color: Text1),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => Homepage(userId: widget.userId,)));
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                "Book your Appointment",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Text1, fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Consumer<mainProvider>(
                builder: (context, value, child) {
                  return Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    child: TextFormField(
                      controller: value.nameCt,
                      maxLines: 1,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Text1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Text1),
                        ),
                        hintText: "Name",
                        hintStyle: TextStyle(
                          fontFamily: "cabin",
                          color: appbar,
                          fontSize: 18,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  );
                },
              ),


          SizedBox(
                height: height / 0.8,
                child: Column(
                  children: [
                    Consumer<mainProvider>(
                      builder: (context, value, child) {
                        return Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            controller: value.placeCt,
                            maxLines: 1,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              hintText: "Place",
                              hintStyle: TextStyle(
                                fontFamily: "cabin",
                                color: appbar,
                                fontSize: 18,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a place';
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    ),
                    Consumer<mainProvider>(
                      builder: (context, value, child) {
                        return Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            controller: value.cityCt,
                            maxLines: 1,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              hintText: "City",
                              hintStyle: TextStyle(
                                fontFamily: "cabin",
                                color: appbar,
                                fontSize: 18,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a city';
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    ),
                    Consumer<mainProvider>(
                      builder: (context, value, child) {
                        return Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            controller: value.addressCt,
                            maxLines: 1,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              hintText: "Address",
                              hintStyle: TextStyle(
                                fontFamily: "cabin",
                                color: appbar,
                                fontSize: 18,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an address';
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    ),
                    Consumer<mainProvider>(
                      builder: (context, value, child) {
                        return Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            controller: value.districtCt,
                            maxLines: 1,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              hintText: "District",
                              hintStyle: TextStyle(
                                fontFamily: "cabin",
                                color: appbar,
                                fontSize: 18,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a district';
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    ),
                    Consumer<mainProvider>(
                      builder: (context, value, child) {
                        return Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            controller: value.stateCt,
                            maxLines: 1,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              hintText: "State",
                              hintStyle: TextStyle(
                                fontFamily: "cabin",
                                color: appbar,
                                fontSize: 18,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a state';
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    ),
                    Consumer<mainProvider>(
                      builder: (context, value, child) {
                        return Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            controller: value.phonenumberCt,
                            maxLines: 1,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Text1),
                              ),
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                fontFamily: "cabin",
                                color: appbar,
                                fontSize: 18,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a phone number';
                              }
                              if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                return 'Please enter a valid 10-digit phone number';
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    ),


                    SizedBox(height: 10),
                    Text(
                      "Advance Payment",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Text1,
                      ),
                    ),
                    SizedBox(height:50),
                    Consumer<mainProvider>(
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {

                              if (widget.from == "NEW") {
                                value.addAddress(widget.from, " ",widget.userId);
                              } else {
                                value.addAddress(widget.from, widget.oldid,widget.userId);
                              }
                              value.getBooking(widget.userId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Userclientdetails(userId: widget.userId, from: '', model: widget.model,),
                                ),
                              );
                            }
                          },
                          child: btn(Text1, "Continue", Colors.white, 150, 40, 18,
                              FontWeight.w500),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//----------------------------------------------------------------------
// import 'package:brown_lines/USER/Advancepayment.dart';
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import '../CONSTANT/Colors.dart';
// import 'Designdetailpage.dart';
//
// class Bookingpage extends StatelessWidget {
//   const Bookingpage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     Widget btn(Color myColor, String text, Color textmycolor, double width,
//         double height, double fonsize, FontWeight fntw) {
//       return Padding(
//         padding: EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
//         child: Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(40),
//             color: myColor,
//           ),
//           child: Center(
//               child: Text(
//             text,
//             style: TextStyle(
//                 fontSize: fonsize, fontWeight: fntw, color: textmycolor),
//           )),
//         ),
//       );
//     }
//
//     return Scaffold(
//       backgroundColor: brown3,
//       appBar: AppBar(
//         shape: Border(
//           bottom: BorderSide(width: 2, color: Text1),
//         ),
//         leading: InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (contex) => Designdetailpage()));
//             },
//             child: Icon(Icons.arrow_back, color: Text1)),
//         backgroundColor: brown3,
//         title: Text("BROWN LINES",
//             style: TextStyle(
//                 fontFamily: "iceland",
//                 color: Text1,
//                 fontSize: 30,
//                 fontWeight: FontWeight.w500)),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Text(
//                 "Book your Appointment",
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                     color: Text1, fontSize: 20, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 8, right: 8),
//                 child: TextField(
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     hintText: "Name",
//                     hintStyle: TextStyle(
//                       fontFamily: "cabin",
//                       color: appbar,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 8, right: 8),
//                 child: TextField(
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     border: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.brown, width: 5)),
//                     hintText: "Date",
//                     hintStyle: TextStyle(
//                       fontFamily: "cabin",
//                       color: appbar,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 500,
//               ),
//               TableCalendar(
//               firstDay: DateTime.utc(2020, 1, 1),
//     lastDay: DateTime.utc(2030, 12, 31),
//     focusedDay: _focusedDay,
//     calendarFormat: _calendarFormat,
//     selectedDayPredicate: (day) {
//     return isSameDay(_selectedDay, day);
//     },
//     onDaySelected: (selectedDay, focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//     setState(() {
//     _selectedDay = selectedDay;
//     _focusedDay = focusedDay;
//     });
//     }
//     },
//     onFormatChanged: (format) {
//     if (_calendarFormat != format) {
//     setState(() {
//     _calendarFormat = format;
//     });
//     }
//     },
//     onPageChanged: (focusedDay) {
//     _focusedDay = focusedDay;
//     },
//     ),
//     );
//   }
//               Container(
//                 margin: EdgeInsets.only(left: 8, right: 8),
//                 child: TextField(
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     border: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.brown, width: 5)),
//                     hintText: "Address",
//                     hintStyle: TextStyle(
//                       fontFamily: "cabin",
//                       color: appbar,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 8, right: 8),
//                 child: TextField(
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     border: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.brown, width: 5)),
//                     hintText: "Phone Number",
//                     hintStyle: TextStyle(
//                       fontFamily: "cabin",
//                       color: appbar,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 8, right: 8),
//                 child: TextField(
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//
//                     hintText: "Type of Mehendi",
//                     hintStyle: TextStyle(
//                       fontFamily: "cabin",
//                       color: appbar,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 8, right: 8),
//                 child: TextField(
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     border: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.brown, width: 5)),
//                     hintText: "Place",
//                     hintStyle: TextStyle(
//                       fontFamily: "cabin",
//                       color: appbar,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 8, right: 8),
//                 child: TextField(
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Text1),
//                     ),
//                     border: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.brown, width: 5)),
//                     hintText: "District",
//                     hintStyle: TextStyle(
//                       fontFamily: "cabin",
//                       color: appbar,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (contex) => Advancepayment()));
//                 },
//                 child: btn(Text1, "Continue", Colors.white, 150, 40, 18,
//                     FontWeight.w500),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
