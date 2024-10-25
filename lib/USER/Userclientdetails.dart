import 'package:brown_lines/USER/Bottomnavigation.dart';
import 'package:brown_lines/USER/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../CONSTANT/Colors.dart';
import '../MODELCLASS/modelclass.dart';
import '../PROVIDER/mainProvider.dart';
import 'CalendarPage.dart';

class Userclientdetails extends StatelessWidget {
  String userId,from,model;
   Userclientdetails({Key? key,
     required this.userId,
     required this.from,
     required this.model,

   }) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:from=="Home"?AppBar(
        leading: null,
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
      ):
      AppBar(
        backgroundColor: brown3,
        centerTitle: true,
        title: Text("Select Address", style: TextStyle(color: Text1)),
      ),
      body: Consumer<mainProvider>(
        builder: (context, val, child) {
          val.getBooking(userId); // Fetch bookings
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  from=="Home"?
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Book your Appointment",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Text1, fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ):SizedBox(),
                  val.bookinglist.isEmpty?
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: const Text("Please add new address",style: TextStyle(fontSize: 22),),
                      ):
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: val.bookinglist.length,
                      itemBuilder: (context, index) {
                        BookingModel booking = val.bookinglist[index];
                        bool isSelected = booking.id == val.selectedAddress?.id;

                        return GestureDetector(
                          onTap: () {
                            val.selectAddress(booking); // Select address on tap
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: isSelected ? Colors.blue : Text1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  isSelected
                                      ? Icons.radio_button_checked // Selected state
                                      : Icons.radio_button_unchecked, // Unselected state
                                  color: isSelected ? Colors.blue : Text1,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        booking.Name,
                                        style: TextStyle(color: Text1, fontSize: 16),
                                      ),
                                      Text(
                                        "${booking.Address}, ${booking.City}, ${booking.State}",
                                        style: TextStyle(color: Text1, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Delete Address"),
                                          content: Text("Are you sure you want to delete this address?"),
                                          actions: [
                                            TextButton(
                                              child: Text("Cancel"),
                                              onPressed: () => Navigator.of(context).pop(),
                                            ),
                                            TextButton(
                                              child: Text("Delete"),
                                              onPressed: () {
                                                val.deleteAddress(booking.id,userId); // Delete address
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // "Add New Address" styled like ListView item
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarPage(from: 'NEW', oldid: '', userId: userId, model: model,),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Text1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle_outline, // Add icon
                            color: Text1,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Add New Address",
                              style: TextStyle(color: Text1, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Consumer<mainProvider>(
                    builder: (context, value, child) {
                      return Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        child: TextFormField(
                          controller: value.timeCt, // Controller to hold the selected date/time
                          maxLines: 1,
                          readOnly: true, // Make the TextFormField read-only
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Text1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Text1),
                            ),
                            hintText: "Select Date & Time",
                            hintStyle: TextStyle(
                              fontFamily: "cabin",
                              color: appbar,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () async {
                            // Show Date Picker
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), // Current date as initial date
                              firstDate: DateTime(2000), // Start date
                              lastDate: DateTime(2101), // End date
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: ColorScheme.light(
                                      primary: Text1, // header background color
                                      onPrimary: Colors.white, // header text color
                                      onSurface: Text1, // body text color
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            if (pickedDate != null) {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: Text1, // time picker header color
                                        onSurface: Text1, // time picker text color
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (pickedTime != null) {
                                DateTime finalDateTime = DateTime(
                                  pickedDate.year,
                                  pickedDate.month,
                                  pickedDate.day,
                                  pickedTime.hour,
                                  pickedTime.minute,
                                );
                                String formattedDateTime =
                                    "${finalDateTime.day.toString().padLeft(2, '0')}/${finalDateTime.month.toString().padLeft(2, '0')}/${finalDateTime.year} ${pickedTime.format(context)}";
                                value.timeCt.text = formattedDateTime;
                              }
                            }
                          },
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please select a date and time';
                            }
                            return null;
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Consumer<mainProvider>(
                    builder: (context, value, child) {
                      return Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        child: TextFormField(
                          controller: value.typeCt,
                          maxLines: 1,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Text1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Text1),
                            ),
                            hintText: "Type",
                            hintStyle: TextStyle(
                              fontFamily: "cabin",
                              color: appbar,
                              fontSize: 18,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a type';
                            }
                            return null;
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Consumer<mainProvider>(
                    builder: (context, value, child) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Text1,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 8, right: 8),
                        child: TextFormField(
                          controller: value.descrCt,
                          maxLines: 3,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Text1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Text1),
                            ),
                            hintText: "Description",
                            hintStyle: TextStyle(
                              fontFamily: "cabin",
                              color: appbar,
                              fontSize: 18,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            if (value.length < 10) {
                              return 'Description should be at least 10 characters long';
                            }
                            return null;
                          },
                        ),
                      );
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text("Confirm Booking"),
              ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Text1, // Text color
                        padding: EdgeInsets.symmetric(vertical: 16), // Button height
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Rounded corners
                        ),
                      ),
                      onPressed: () {
    if (_formKey.currentState!.validate()) {
      if (val.selectedAddress != null) {
        val.confirmBooking(model,userId);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => bottomnavigation(
              Userid:userId, Username: '', Usernumber: '',)));
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select an address")),
        );
      }
    }
                      },
                    ),
                  ),
                  SizedBox(height: 100,)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
