
import 'package:brown_lines/ADMIN/Clientdetails.dart';
import 'package:brown_lines/ADMIN/products.dart';
import 'package:brown_lines/ADMIN/Adminpages.dart';
import 'package:brown_lines/ADMIN/Advertisement2.dart';
import 'package:brown_lines/ADMIN/AddAdvertisement.dart';
import 'package:brown_lines/ADMIN/Bookeduserdetails.dart';
import 'package:brown_lines/ADMIN/Bookedusers.dart';
import 'package:brown_lines/ADMIN/Addfeedpage.dart';
import 'package:brown_lines/ADMIN/Postimage.dart';
import 'package:brown_lines/ADMIN/Addproducts.dart';
import 'package:brown_lines/ADMIN/Productorders1.dart';
import 'package:brown_lines/PROVIDER/loginProvider.dart';
import 'package:brown_lines/PROVIDER/mainProvider.dart';
import 'package:brown_lines/USER/Advancepayment.dart';
import 'package:brown_lines/USER/Advertisementdettails.dart';
import 'package:brown_lines/USER/Cartpage.dart';
import 'package:brown_lines/USER/Chatbox.dart';
import 'package:brown_lines/USER/Customerdetailspage.dart';
import 'package:brown_lines/USER/Deliverydetailspage.dart';
import 'package:brown_lines/USER/Designdetailpage.dart';
import 'package:brown_lines/USER/Feedpage.dart';
import 'package:brown_lines/USER/Homepage.dart';
import 'package:brown_lines/USER/Loginpage.dart';
import 'package:brown_lines/USER/Messagespage.dart';
import 'package:brown_lines/USER/Otppage.dart';
import 'package:brown_lines/USER/Productdetailpage.dart';
import 'package:brown_lines/USER/Shophomepage.dart';
import 'package:brown_lines/USER/Signuppage.dart';
import 'package:brown_lines/USER/Thankyoupage.dart';
import 'package:brown_lines/USER/Thankyoupage2.dart';
import 'package:brown_lines/USER/Totalpage.dart';
import 'package:brown_lines/USER/Userprofilepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ADMIN/Addpostimage.dart';
import 'ADMIN/Feedpageadmin.dart';
import 'ADMIN/Productorders2.dart';
import 'ADMIN/Userspage.dart';
import 'USER/CalendarPage.dart';
import 'USER/Bottomnavigation.dart';
import 'USER/Bottomnavigation2.dart';
import 'USER/Splashpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBPdd8Far_1EcRhSCSVhCbifMls-cZLMzY',
      appId: '1:825432857634:android:0e7d81bca4bcca3c07be7b',
      messagingSenderId: '825432857634',
      projectId: 'brown-lines-1b039',
      storageBucket: 'brown-lines-1b039.appspot.com'
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>mainProvider(),),
      ChangeNotifierProvider(create: (context)=>loginprovider(),),
    ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:SplashScreen(),
      ),
    );
  }
}

