import 'package:brown_lines/CONSTANT/Colors.dart';
import 'package:brown_lines/USER/Loginpage.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/loginProvider.dart';
import '../PROVIDER/mainProvider.dart';

// class SplashPage extends StatelessWidget {
//   const SplashPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
// backgroundColor: brown3,
//       body: Column(crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 180),
//                 child: Image(
//                   image: AssetImage("assets/img.png",),
//                     height:300,width: 300,
//                 ),
//               ),
//             ),
//         ],
//       ),
//       ),
//     );
//   }
// }



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    // print("codee id here");

    Timer? _timer;
    final FirebaseFirestore db = FirebaseFirestore.instance;
    String type= '';

    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;

    super.initState();

    loginprovider loginProvider = Provider.of<loginprovider>(context, listen: false);
    mainProvider mainProv = Provider.of<mainProvider>(context, listen: false);



    Timer(const Duration(seconds: 3), () {
      if (loginUser == null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginpage()));
      }
      else {
        loginProvider.userAuthorized(loginUser.phoneNumber, context);
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    mainProvider provider = Provider.of<mainProvider>(context, listen: true);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: const Color(0xfffff1e2),
        systemNavigationBarColor: Color(0xfffff1e2),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true,
      ),
      child: Scaffold(
        backgroundColor: brown3,
        body: Center(child: Image.asset("assets/img.png",scale: 2,)),

      ),
    );
  }
}