import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../MODELCLASS/modelclass.dart';

class mainProvider with ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref("IMAGE URL");

  TextEditingController postcategorycontroller = TextEditingController();
  TextEditingController pricedetailscontroller = TextEditingController();

  File? postFileImage;
  String postimg = '';
  Reference ref1 = FirebaseStorage.instance.ref("IMAGE ");


  Future<void> addPostImage(String from,String oldid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> map = HashMap();

    map["POST_ID"] = id;
    map["POST_CATEGORY"] = postcategorycontroller.text;
    map["PRICE_DETAILS"] = pricedetailscontroller.text;
    if (from=="NEW"){
      map["POST_ID"]=id;
    }
    print("sabhkajsdl");

    if (postFileImage != null) {
      print("njsbcd");
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child('Images').child(photoId);

      try {
        await ref.putFile(postFileImage!).whenComplete(() async {
          print("Upload complete: " + postFileImage!.toString());

          await ref.getDownloadURL().then((value1) {
            map["PHOTO"] = value1;
            print("Download URL obtained: " + value1);
            notifyListeners();
          }).catchError((error) {
            print("Error getting download URL: " + error.toString());
          });

          notifyListeners();
        }).catchError((error) {
          print("Error during upload: " + error.toString());
        });
      } catch (e) {
        print("Caught error: " + e.toString());
      }

      notifyListeners();
    }
    else {
      print("imhere" + postFileImage!.toString());
      print("heloooooioi");
      map["PHOTO"]=postimg;

    }
    if (from == "EDIT") {
      db.collection("POST_IMAGE").doc(oldid).update(map);
    } else {
      db.collection("POST_IMAGE").doc(id).set(map);
    }
    print("herealso"+postFileImage!.toString());

    getPostImage();
    notifyListeners();
  }

  Future getImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');


    }
  }

  Future getImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
    notifyListeners();
  }

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      postFileImage = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");

      notifyListeners();
    }
  }



  List <PostModel> postlist = [];

  //------------------- get post image --------------
void getPostImage(){
  db.collection("POST_IMAGE").get().then((value){
    if(value.docs.isNotEmpty){
      postlist.clear();
      for(var element in value.docs){
        postlist.add(PostModel(element.id, element.get("PHOTO"), element.get("POST_CATEGORY"), element.get("PRICE_DETAILS")));
        notifyListeners();
      }
      notifyListeners();
    }
  });
  notifyListeners();
}
  //--------------clear---image
  void clearPostImage() {
    postcategorycontroller.clear();
    pricedetailscontroller.clear();
    postFileImage = null;
    postimg = " ";
  }

//---------delete----------
  void DeletePostImage(id, BuildContext context) {
    db.collection("POST_IMAGE").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Succesfully"),
        ));
  }

  //----------edit-----*+
  void EditPostImage(String id) {
    db.collection("POST_IMAGE").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> addmap = value.data() as Map;
        postcategorycontroller.text = addmap["CATEGORY_NAME"].toString();
        postimg = addmap["PHOTO"];
        getPostImage();
        notifyListeners();
      }
    });
    notifyListeners();
  }



  //------------Advertisement-------
  TextEditingController advtnameCt = TextEditingController();
  TextEditingController advtpricedetailsCt = TextEditingController();
  TextEditingController advtprodescriptionCt = TextEditingController();

  File? advtFileImage;
  String advtimg = '';
  Reference ref2 = FirebaseStorage.instance.ref("IMAGE ");


  Future<void> addAdvtImage(String from,String oldid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> map = HashMap();

    map["ADVERTISEMENT_ID"] = id;
    map["ADVERTISEMENT_PRICE"] = advtpricedetailsCt.text.toString();
    map["ADVERTISEMENT_DESCRIPTION"] = advtprodescriptionCt.text.toString();
    map["ADVERTISEMENT_NAME"] = advtnameCt.text.toString();

    if (from=="NEW"){
      map["ADVERTISEMENT_ID"]=id;
    }
    print("sabhkajsdl");

    if (advtFileImage != null) {
      print("njsbcd");
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child('Images').child(photoId);

      try {
        await ref.putFile(advtFileImage!).whenComplete(() async {
          print("Upload complete: " + advtFileImage!.toString());

          await ref.getDownloadURL().then((value1) {
            map["PHOTO"] = value1;
            print("Download URL obtained: " + value1);
            notifyListeners();
          }).catchError((error) {
            print("Error getting download URL: " + error.toString());
          });

          notifyListeners();
        }).catchError((error) {
          print("Error during upload: " + error.toString());
        });
      } catch (e) {
        print("Caught error: " + e.toString());
      }

      notifyListeners();
    }
    else {
      print("imhere" + advtFileImage!.toString());
      print("heloooooioi");
      map["PHOTO"]=advtimg;


    }
    if (from == "EDIT") {
      db.collection("ADVERTISEMENT_IMAGE").doc(oldid).update(map);
    } else {
      db.collection("ADVERTISEMENT_IMAGE").doc(id).set(map);
    }
    print("herealso"+advtFileImage!.toString());

    getAdvtImage();
    notifyListeners();
  }

  Future getAdvtImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropAdvtImage(pickedImage.path, "");
    } else {
      print('No image selected.');


    }
  }

  Future getAdvtImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropAdvtImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
    notifyListeners();
  }

  Future<void> cropAdvtImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      advtFileImage = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");

      notifyListeners();
    }
  }



  List <AdvtModel> advtlist = [];

  //------------------- get post image --------------
  void getAdvtImage(){
    db.collection("ADVERTISEMENT_IMAGE").get().then((value){
      if(value.docs.isNotEmpty){
        advtlist.clear();
        for(var element in value.docs){
          advtlist.add(AdvtModel(element.id, 
            element.get("PHOTO"),
            element.get("ADVERTISEMENT_NAME"),
            element.get("ADVERTISEMENT_PRICE"),
            element.get("ADVERTISEMENT_DESCRIPTION")
          ));
          notifyListeners();
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }
  //--------------clear---image
  void clearAdvtImage() {
    advtnameCt.clear();
    advtpricedetailsCt.clear();
    advtprodescriptionCt.clear();
    advtFileImage = null;
    advtimg = " ";
  }

//---------delete----------
  void DeleteAdvtImage(id, BuildContext context) {
    db.collection("ADVERTISEMENT_IMAGE").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Succesfully"),
        ));
  }

  //----------edit-----*+
  void EditAdvtImage(String id) {
    db.collection("ADVERTISEMENT_IMAGE").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> addmap = value.data() as Map;
        advtimg = addmap["PHOTO"];
        advtprodescriptionCt=addmap["ADVERTISEMENT_DESCRIPTION"];
        advtpricedetailsCt=addmap["ADVERTISEMENT_PRICE"];
        advtnameCt=addmap["ADVERTISEMENT_NAME"];
        getAdvtImage();
        notifyListeners();
      }
    });
    notifyListeners();
  }


//--------------- products----------

  TextEditingController productcategoryCt = TextEditingController();
  TextEditingController pricedetailsCt = TextEditingController();
  TextEditingController prodescriptionCt = TextEditingController();

  File? productFileImage=null;
   // File? FileImage;
  String productimg = '';
  Reference ref3 = FirebaseStorage.instance.ref("IMAGE ");

  Future<void> addProductImage(String from,String oldid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> map = HashMap();
    map["PRODUCT_ID"]=id;
    map["PRODUCT_CATEGORY"] = productcategoryCt.text;
    map["PRICE_DETAILS"] = pricedetailsCt.text;
    map["PRODUCT_DESCRIPTION"] = prodescriptionCt.text;
    if (from=="NEW"){
      map["PRODUCT_ID"]=id;
    }
    print("sabhkajsdl");

    if (productFileImage != null) {
      print("njsbcd");
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child('Images').child(photoId);

      try {
        await ref.putFile(productFileImage!).whenComplete(() async {
          print("Upload complete: " + productFileImage!.toString());

          await ref.getDownloadURL().then((value1) {
            map["PHOTO"] = value1;
            print("Download URL obtained: " + value1);
            notifyListeners();
          }).catchError((error) {
            print("Error getting download URL: " + error.toString());
          });

          notifyListeners();
        }).catchError((error) {
          print("Error during upload: " + error.toString());
        });
      } catch (e) {
        print("Caught error: " + e.toString());
      }

      notifyListeners();
    }
    else {
      print("imhere" + productFileImage!.toString());
      print("heloooooioi");
      map["PHOTO"]=productimg;
    }
    if (from == "EDIT") {
      db.collection("PRODUCT_IMAGE").doc(oldid).update(map);
    } else {
      db.collection("PRODUCT_IMAGE").doc(id).set(map);
    }
    print("herealso"+productFileImage!.toString());

    getProductImage();
    notifyListeners();
  }

  Future getProductImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropProductImage(pickedImage.path, "");
    } else {
      print('No image selected.');


    }
  }

  Future getProductImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropProductImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
    notifyListeners();
  }

  Future<void> cropProductImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      productFileImage = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");

      notifyListeners();
    }
  }



  List <ProductModel> productlist = [];

  //------------------- get post image --------------
  void getProductImage(){
    db.collection("PRODUCT_IMAGE").get().then((value){
      if(value.docs.isNotEmpty){
        productlist.clear();
        for(var element in value.docs){
          productlist.add(ProductModel(
              element.id,
              element.get("PHOTO"),
              element.get("PRODUCT_CATEGORY").toString(),
              element.get("PRICE_DETAILS").toString(),
              element.get("PRODUCT_DESCRIPTION").toString()));
          notifyListeners();
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }
  //--------------clear---image
  void clearProductImage() {
    productcategoryCt.clear();
    pricedetailsCt.clear();
    prodescriptionCt.clear();
    productFileImage = null;
    productimg = " ";
  }

//---------delete----------
  void DeleteProductImage(id, BuildContext context) {
    db.collection("PRODUCT_IMAGE").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Succesfully"),
        ));
  }

  //----------edit-----*+
  void EditProductImage(String id) {
    db.collection("PRODUCT_IMAGE").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> addmap = value.data() as Map;
        productcategoryCt.text = addmap["CATEGORY_NAME"].toString();
        pricedetailsCt.text = addmap["PRICE_DETAILS"].toString();
        prodescriptionCt.text = addmap["PRODUCT_DESCRIPTION"].toString();
        productimg = addmap["PHOTO"];
        getProductImage();
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();

  }

//----------feedpage----------------

  TextEditingController adminnameCt = TextEditingController();
  TextEditingController instalinkCt = TextEditingController();
  TextEditingController descriptionCt = TextEditingController();

  File? feedFileImage;
  String feedimg = '';
  Reference ref4 = FirebaseStorage.instance.ref("IMAGE ");

  Future<void> addFeedImage(String from,String oldid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> map = HashMap();

    map["FEED_ID"] = id;
    map["ADMIN_NAME"] = adminnameCt.text;
    map["INSTA_LINK"] = instalinkCt.text;
    map["DESCRIPTION_DETAILS"] = descriptionCt.text;
    if (from=="NEW"){
      map["FEED_ID"]=id;
    }
    print("sabhkajsdl");

    if (feedFileImage != null) {
      print("njsbcd");
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child('Images').child(photoId);

      try {
        await ref.putFile(feedFileImage!).whenComplete(() async {
          print("Upload complete: " + feedFileImage!.toString());

          await ref.getDownloadURL().then((value1) {
            map["PHOTO"] = value1;
            print("Download URL obtained: " + value1);
            notifyListeners();
          }).catchError((error) {
            print("Error getting download URL: " + error.toString());
          });

          notifyListeners();
        }).catchError((error) {
          print("Error during upload: " + error.toString());
        });
      } catch (e) {
        print("Caught error: " + e.toString());
      }

      notifyListeners();
    }
    else {
      print("imhere" + feedFileImage!.toString());
      print("heloooooioi");
      map["PHOTO"]=feedimg;

    }
    if (from == "EDIT") {
      db.collection("FEED_IMAGE").doc(oldid).update(map);
    } else {
      db.collection("FEED_IMAGE").doc(id).set(map);
    }
    print("herealso"+feedFileImage!.toString());

    getFeedImage();
    notifyListeners();
  }

  Future getFeedImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropFeedImage(pickedImage.path, "");
    } else {
      print('No image selected.');


    }
  }

  Future getFeedImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropFeedImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
    notifyListeners();
  }

  Future<void> cropFeedImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      feedFileImage = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");

      notifyListeners();
    }
  }



  List <FeedModel> feedlist = [];

  //------------------- get post image --------------
  void getFeedImage(){
    db.collection("FEED_IMAGE").get().then((value){
      if(value.docs.isNotEmpty){
        feedlist.clear();
        for(var element in value.docs){
          feedlist.add(FeedModel(element.id, element.get("PHOTO"), element.get("ADMIN_NAME"), element.get("INSTA_LINK"),
              element.get("DESCRIPTION_DETAILS")));
          notifyListeners();
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }
  //--------------clear---image
  void clearFeedImage() {
    adminnameCt.clear();
    instalinkCt.clear();
    descriptionCt.clear();
    feedFileImage = null;
    productimg = " ";
  }

//---------delete----------
  void DeleteFeedImage(id, BuildContext context) {
    db.collection("FEED_IMAGE").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Succesfully"),
        ));
  }

  //----------edit-----*+
  void EditFeedImage(String id) {
    db.collection("FEED_IMAGE").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> addmap = value.data() as Map;
        adminnameCt.text = addmap["ADMIN_NAME"].toString();
        instalinkCt.text = addmap["INSTA_LINK"].toString();
        descriptionCt.text = addmap["DESCRIPTION_DETAILS"].toString();
        feedimg = addmap["PHOTO"];
        getFeedImage();
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();
  }
  // ---------------------------------------------

  TextEditingController addtobagCt = TextEditingController();
  TextEditingController buynowCt = TextEditingController();

  File? proFileImage;
  String proimg = '';
  Reference ref6 = FirebaseStorage.instance.ref("IMAGE ");

// void getCartDetails() {
  //   db.collection("CART").get().then((value) {
  //     if (value.docs.isNotEmpty) {
  //       cartlist.clear();
  //       for (var element in value.docs) {
  //         cartlist.add(cartDetails(
  //           element.id,
  //           element.get("PRO_PHOTO"),
  //           element.get("PRO_NAME"),
  //           element.get("PRO_PRICE"),
  //           element.get("TOTAL_PRICE"),
  //           element.get("QTY"),
  //           element.get("USER_ID"),
  //           element.get("COUNT")!= null ?element.get("COUNT")as int : 1,
  //
  //
  //         ));
  //       }
  //       notifyListeners();
  //     }
  //   }).catchError((error) {
  //     print("Error fetching cart details: $error");
  //   });
  // }
  // Future<void> getCartDetails() async {
  //   try {
  //     QuerySnapshot querySnapshot = await db.collection("CART").get();
  //     if (querySnapshot.docs.isNotEmpty) {
  //       cartlist.clear();
  //       for (var doc in querySnapshot.docs) {
  //         cartlist.add(cartDetails(
  //           doc.id,
  //           doc.get("PRO_PHOTO"),
  //           doc.get("PRO_NAME"),
  //           doc.get("PRO_PRICE"),
  //           doc.get("TOTAL_PRICE"),
  //           doc.get("QTY"),
  //           doc.get("USER_ID"),
  //           doc.get("COUNT") ?? 1,
  //         ));
  //       }
  //       notifyListeners();
  //     }
  //   } catch (error) {
  //     print("Error fetching cart details: $error");
  //   }
  // }
  // Future<void> getCartDetails() async {
  //   print("Fetching cart details...");
  //   try {
  //     bool getcart = true;
  //     notifyListeners();
  //
  //     final QuerySnapshot snapshot = await db.collection("CART").get();
  //     // cartlist.clear();
  //
  //     if (snapshot.docs.isNotEmpty) {
  //       for (var doc in snapshot.docs) {
  //         Map<String, dynamic> cartData = doc.data() as Map<String, dynamic>;
  //         cartlist.add(cartDetails(
  //           cartData["PRO_ID"].toString(),
  //           cartData["PRO_PHOTO"].toString(),
  //           cartData["PRO_NAME"].toString(),
  //           cartData["PRO_PRICE"].toString(),
  //           cartData["TOTAL_PRICE"].toString(),
  //           cartData["QTY"].toString(),
  //           cartData["USER_ID"].toString(),
  //           cartData["COUNT"] != null ? cartData["COUNT"] as int : 1,
  //         ));
  //       }
  //       print("Cart details fetched: ${cartlist.length}");
  //     } else {
  //       print("No cart details found.");
  //     }
  //   } catch (e) {
  //     print("Error fetching cart details: $e");
  //   } finally {
  //     bool getcart = false;
  //     // If you want to keep track of the number of items, uncomment the next line
  //     // String slno = cartlist.length.toString();
  //     notifyListeners();
  //   }
  // }
  Future<void> addtoCart(BuildContext context, String name, String price, String photo,String Userid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> map = HashMap();

    map["PRO_ID"] = id;
    map["USER_ID"] = Userid;
    map["PRO_NAME"] = name;
    map["QTY"] = 1;
    map["PRO_PRICE"] = price;
    map["TOTAL_PRICE"] = price;
    map["PRO_PHOTO"] = photo;

    try {
      await db.collection("CART").doc(id).set(map);
      print("Item added to cart");

      // Show Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Item added to cart successfully!"),
          duration: Duration(seconds: 2),
        ),
      );

      notifyListeners();
    } catch (e) {
      print("Error adding item to cart: $e");

      // Show Snackbar on error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to add item to cart."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  List<cartDetails> cartlist =[];




  Future<void> getCartDetails(String userId) async {
    print("Fetching cart details...");
    try {
      // getcart = true;
      // notifyListeners();

      final QuerySnapshot snapshot = await db.collection("CART").where("USER_ID",isEqualTo: userId).get();

      if (snapshot.docs.isNotEmpty) {
        cartlist.clear();

        for (var doc in snapshot.docs) {
          Map<String, dynamic> cartData = doc.data() as Map<String, dynamic>;

          cartlist.add(cartDetails(
            cartData["PRO_ID"].toString(),
            cartData["PRO_PHOTO"].toString(),
            cartData["PRO_NAME"].toString(),
            cartData["PRO_PRICE"].toString(),
            cartData["TOTAL_PRICE"].toString(),
            cartData["GRAND_TOTAL_PRICE"].toString(),
            cartData["QTY"].toString(),
            cartData["USER_ID"].toString(),
            cartData["COUNT"] != null ? cartData["COUNT"] as int : 1,
          ));
        }
        print("Cart details fetched: ${cartlist.length}");
      } else {
        print("No cart details found.");
      }
    } catch (e) {
      print("Error fetching cart details: $e");
    } finally {
      // getcart = false;
      // slno = cartlist.length.toString();
      notifyListeners();
    }
  }
  void countIncrement(int index, String id) {
    if (index >= 0 && index < cartlist.length) {
      cartlist[index].count++;
      updateItemDetails(index, id);
      notifyListeners();
    }
  }

  void countDecrement(int index, String id) {
    if (index >= 0 &&
        index < cartlist.length &&
        cartlist[index].count > 1) {
      cartlist[index].count--;
      updateItemDetails(index, id);
      notifyListeners();
    }
  }

  Future<void> updateItemDetails(int index, String id) async {
    double initialPrice = double.parse(cartlist[index].Price);
    double newPrice = initialPrice * cartlist[index].count;

    cartlist[index].TotalPrice = newPrice.toStringAsFixed(2);
    cartlist[index].qty = cartlist[index].count.toString();

    await db.collection("CART"
        "").doc(id).set({
      "TOTAL_PRICE": cartlist[index].TotalPrice,
      "QTY": cartlist[index].qty
    }, SetOptions(merge: true));

    notifyListeners();
  }

  double calculateTotalPrice() {
    return cartlist.fold(0, (sum, item) => sum + double.parse(item.TotalPrice));
  }

  Future<void> deleteFromCart(BuildContext context, String id) async {
    try {
      int indexToRemove = cartlist.indexWhere((item) => item.id == id);
      if (indexToRemove != -1) {
        cartlist.removeAt(indexToRemove);
        notifyListeners(); // Update UI immediately
      } else {
        print("Item not found in local list");
      }
      await db.collection("CART").doc(id).delete();
      print("Item deleted from cart");

      // Show Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Item deleted from cart successfully!"),
          duration: Duration(seconds: 2),
        ),
      );

      // Update local state if necessary
      // You might need to remove the item from the cartlist manually
      // Example: cartlist.removeWhere((item) => item.id == id);

      notifyListeners();
      // getCartDetails();
    } catch (e) {
      print("Error deleting item from cart: $e");

      // Show Snackbar on error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to delete item from cart."),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
  List<cartDetails> cartItem = [];



  void deleteFromCarts(BuildContext context, String id) {
    cartlist.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  //----------------------------------------------------------------------------------
  TextEditingController usernameController = TextEditingController();
  TextEditingController usernumberController = TextEditingController();

  void addUser() {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> map = HashMap();
    map["User_Id"] = id;
    map["User_Name"] = usernameController.text;
    map["User_Number"] = "+91${usernumberController.text}";
    map["Type"] = "USER";

    db.collection("USERS").doc(id).set(map);
    getUser();
    notifyListeners();
  }

  List<usermodelclass> UserDetails = [];

  void getUser() {
    db.collection("USERS").get().then((value) {
      if (value.docs.isNotEmpty) {
        UserDetails.clear();
        for (var element in value.docs) {
          UserDetails.add(
            usermodelclass(
              element.id,
              element.get("User_Name").toString(),
              element.get("User_Number").toString(),
            ),
          );
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }



//-------------------------------------------------
//
//   TextEditingController usernameCt = TextEditingController();
//
//
//   File? profileFileImage;
//   String profileimg = '';
//   Reference ref5 = FirebaseStorage.instance.ref("IMAGE ");
//
//   Future<void> addProfileImage(String from,String oldid) async {
//     String id = DateTime.now().millisecondsSinceEpoch.toString();
//     Map<String, dynamic> map = HashMap();
//
//     map["FEED_ID"] = id;
//     map["USER_NAME"] = usernameCt.text;
//     if (from=="NEW"){
//       map["PROFILE_ID"]=id;
//     }
//     print("sabhkajsdl");
//
//     if (profileFileImage != null) {
//       print("njsbcd");
//       String photoId = DateTime.now().millisecondsSinceEpoch.toString();
//       ref = FirebaseStorage.instance.ref().child('Images').child(photoId);
//
//       try {
//         await ref.putFile(profileFileImage!).whenComplete(() async {
//           print("Upload complete: " + profileFileImage!.toString());
//
//           await ref.getDownloadURL().then((value1) {
//             map["PHOTO"] = value1;
//             print("Download URL obtained: " + value1);
//             notifyListeners();
//           }).catchError((error) {
//             print("Error getting download URL: " + error.toString());
//           });
//
//           notifyListeners();
//         }).catchError((error) {
//           print("Error during upload: " + error.toString());
//         });
//       } catch (e) {
//         print("Caught error: " + e.toString());
//       }
//
//       notifyListeners();
//     }
//     else {
//       print("imhere" + profileFileImage!.toString());
//       print("heloooooioi");
//       map["PHOTO"]=profileimg;
//
//     }
//     if (from == "EDIT") {
//       db.collection("PROFILE_IMAGE").doc(oldid).update(map);
//     } else {
//       db.collection("PROFILE_IMAGE").doc(id).set(map);
//     }
//     print("herealso"+profileFileImage!.toString());
//
//     getFeedImage();
//     notifyListeners();
//   }
//
//   Future getProfileImggallery() async {
//     final imagePicker = ImagePicker();
//     final pickedImage =
//     await imagePicker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       cropProfileImage(pickedImage.path, "");
//     } else {
//       print('No image selected.');
//
//
//     }
//   }
//
//   Future getProfileImgcamera() async {
//     final imgPicker = ImagePicker();
//     final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);
//
//     if (pickedImage != null) {
//       cropProfileImage(pickedImage.path, "");
//     } else {
//       print('No image selected.');
//     }
//     notifyListeners();
//   }
//
//   Future<void> cropProfileImage(String path, String from) async {
//     final croppedFile = await ImageCropper().cropImage(
//       sourcePath: path,
//       aspectRatioPresets: Platform.isAndroid
//           ? [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9,
//       ]
//           : [
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio5x3,
//         CropAspectRatioPreset.ratio5x4,
//         CropAspectRatioPreset.ratio7x5,
//         CropAspectRatioPreset.ratio16x9,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.white,
//             toolbarWidgetColor: Colors.black,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         IOSUiSettings(
//           title: 'Cropper',
//         )
//       ],
//     );
//     if (croppedFile != null) {
//       profileFileImage = File(croppedFile.path);
//       // print(Registerfileimg.toString() + "fofiifi");
//
//       notifyListeners();
//     }
//   }
//
//
//
//   List <ProfileModel> profilelist = [];
//
//   //------------------- get post image --------------
//   void getProfileImage(){
//     db.collection("PROFILE_IMAGE").get().then((value){
//       if(value.docs.isNotEmpty){
//         profilelist.clear();
//         for(var element in value.docs){
//           profilelist.add(ProfileModel(element.id,element.get("USER_NAME"), element.get("PHOTO"),
//           ));
//           notifyListeners();
//         }
//         notifyListeners();
//       }
//     });
//     notifyListeners();
//   }
//   //--------------clear---image
//   void clearProfileImage() {
//     usernameCt.clear();
//     profileFileImage = null;
//     profileimg = " ";
//   }
//
// //---------delete----------
//   void DeleteProfileImage(id, BuildContext context) {
//     db.collection("PROFILE_IMAGE").doc(id).delete();
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Delete Succesfully"),
//         ));
//   }
//
//   //----------edit-----*+
//   void EditProfileImage(String id) {
//     db.collection("PROFILE_IMAGE").doc(id).get().then((value) {
//       if (value.exists) {
//         Map<dynamic, dynamic> addmap = value.data() as Map;
//         usernameCt.text = addmap["USER_NAME"].toString();
//         profileimg = addmap["PHOTO"];
//         getProfileImage();
//         notifyListeners();
//       }
//       notifyListeners();
//     });
//     notifyListeners();
//   }



  File? userImageFile = null;
  String userImageUrl = '';
  Reference ref5 = FirebaseStorage.instance.ref("IMAGE ");

  Future<void> addOrUpdateUserImage(String userId) async {
    // Create a reference to the document for this user
    DocumentReference userDocRef = db.collection("USER_IMAGES").doc(userId);
    String photoId = DateTime.now().millisecondsSinceEpoch.toString();

    // Get the current user document
    DocumentSnapshot userDoc = await userDocRef.get();

    Map<String, dynamic> map = {
      "USER_ID": userId,
    };

    // Check if the image file is not null
    if (userImageFile != null) {
      // Upload new image
      ref = FirebaseStorage.instance.ref().child('Images').child(photoId);

      try {
        await ref.putFile(userImageFile!).whenComplete(() async {
          print("Upload complete: " + userImageFile!.toString());

          await ref.getDownloadURL().then((downloadUrl) {
            map["USER_IMAGE"] = downloadUrl;
            print("Download URL obtained: " + downloadUrl);
            notifyListeners();
          }).catchError((error) {
            print("Error getting download URL: " + error.toString());
          });
        }).catchError((error) {
          print("Error during upload: " + error.toString());
        });
      } catch (e) {
        print("Caught error: " + e.toString());
      }

      notifyListeners();
    }

    // Check if user document exists
    if (userDoc.exists && userDoc.get("USER_IMAGE") != null) {
      // Update the existing image
      userDocRef.update(map);
      print("Image updated for user: " + userId);
    } else {
      // Add a new image
      map["USER_IMAGE_ID"] = photoId;
      userDocRef.set(map);
      print("New image added for user: " + userId);
    }

    getUserImages();
    notifyListeners();
  }

  Future<void> pickUserImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropUserImage(pickedImage.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> pickUserImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropUserImage(pickedImage.path);
    } else {
      print('No image selected.');
    }
    notifyListeners();
  }

  Future<void> cropUserImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );

    if (croppedFile != null) {
      userImageFile = File(croppedFile.path);
      notifyListeners();
    }
  }

  List<UserImageModel> userImagesList = [];

  void getUserImages() {
    db.collection("USER_IMAGES").get().then((value) {
      if (value.docs.isNotEmpty) {
        userImagesList.clear();
        for (var element in value.docs) {
          userImagesList.add(UserImageModel(
            element.id,
            element.get("USER_IMAGE"),
            element.get("USER_ID"),
          ));
          print(userImagesList.length.toString()+"jkhjkkjkjkjkjlkjkj");
          notifyListeners();
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }


  // -----------------------------------------------
  TextEditingController nameCt = TextEditingController();
  TextEditingController timeCt = TextEditingController();
  TextEditingController addressCt = TextEditingController();
  TextEditingController placeCt = TextEditingController();
  TextEditingController cityCt = TextEditingController();
  TextEditingController districtCt = TextEditingController();
  TextEditingController stateCt = TextEditingController();
  TextEditingController phonenumberCt = TextEditingController();
  TextEditingController typeCt = TextEditingController();
  TextEditingController descrCt = TextEditingController();

  // File? FileImage;

  Future<void> addAddress(String from, String oldid, String userId) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> addmap = HashMap();
    addmap["BOOKING_ID"] = id;
    addmap["CUSTOMER_ID"] = userId;
    addmap["NAME"] = nameCt.text;
    // addmap["TIME"] = timeCt.text;
    addmap["ADDRESS"] = addressCt.text;
    addmap["PLACE"] = placeCt.text;
    addmap["CITY"] = cityCt.text;
    addmap["DISTRICT"] = districtCt.text;
    addmap["STATE"] = stateCt.text;
    addmap["PHONE_NUMBER"] = phonenumberCt.text;
    // addmap["TYPE"] = typeCt.text;
    // addmap["DESCRIPTION"] = descrCt.text;

    try {
      if (from == "NEW") {
        addmap["BOOKING_ID"] = id;
        await db.collection("ADDRESS").doc(id).set(addmap);  // New Address
      } else if (from == "EDIT") {
        await db.collection("ADDRESS").doc(oldid).update(addmap);  // Edit Address
      }

      print("Address successfully added/updated.");

      // Call the clear function after successful addition or update
      clearFields();

    } catch (e) {
      print("Error adding/updating address: $e");
    }

    print("Operation complete.");
  }

// Clear function to reset all text controllers
  void clearFields() {
    nameCt.clear();
    timeCt.clear();
    addressCt.clear();
    placeCt.clear();
    cityCt.clear();
    districtCt.clear();
    stateCt.clear();
    phonenumberCt.clear();
    typeCt.clear();
    descrCt.clear();

    print("All fields cleared.");
  }


  // Future getBookingImggallery() async {
  //   final imagePicker = ImagePicker();
  //   final pickedImage =
  //   await imagePicker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedImage != null) {
  //     cropProductImage(pickedImage.path, "");
  //   } else {
  //     print('No image selected.');
  //
  //
  //   }
  // }

  // Future getBookingImgcamera() async {
  //   final imgPicker = ImagePicker();
  //   final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);
  //
  //   if (pickedImage != null) {
  //     cropProductImage(pickedImage.path, "");
  //   } else {
  //     print('No image selected.');
  //   }
  //   notifyListeners();
  // }

  // Future<void> cropBookingImage(String path, String from) async {
  //   final croppedFile = await ImageCropper().cropImage(
  //     sourcePath: path,
  //     aspectRatioPresets: Platform.isAndroid
  //         ? [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9,
  //     ]
  //         : [
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio5x3,
  //       CropAspectRatioPreset.ratio5x4,
  //       CropAspectRatioPreset.ratio7x5,
  //       CropAspectRatioPreset.ratio16x9,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: Colors.white,
  //           toolbarWidgetColor: Colors.black,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       IOSUiSettings(
  //         title: 'Cropper',
  //       )
  //     ],
  //   );
  //   if (croppedFile != null) {
  //     productFileImage = File(croppedFile.path);
  //     // print(Registerfileimg.toString() + "fofiifi");
  //
  //     notifyListeners();
  //   }
  // }
  BookingModel? selectedAddress;

   selectAddress(BookingModel address) {
    if (selectedAddress?.id == address.id) {
      selectedAddress = null;
    }
    else
    {
      selectedAddress = address;
    }
    notifyListeners();
  }

  Future<void> confirmBooking(String model,String userId) async {
    if (selectedAddress == null) {
      throw Exception("No address selected");
    }

    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      HashMap<String,dynamic> confirmBooking=HashMap();
      confirmBooking["BOOKING_ID"]=id;
      confirmBooking["USER_ID"]=userId;
      confirmBooking["BOOKING_MODEL"]=model;
      confirmBooking["BOOKING_PERSON"]=selectedAddress!.Name;
      confirmBooking["DATE"]= DateTime.now().toString();
      confirmBooking["BOOKING_DATE"]= timeCt.text;
      confirmBooking["BOOKING_ADDRESS"]=selectedAddress!.Address;
      confirmBooking["BOOKING_PLACE"]=selectedAddress!.Place;
      confirmBooking["BOOKING_CITY"]=selectedAddress!.City;
      confirmBooking["BOOKING_DISTRICT"]=selectedAddress!.District;
      confirmBooking["BOOKING_STATE"]=selectedAddress!.State;
      confirmBooking["BOOKING_PHONE"]=selectedAddress!.Phonenumber;
      confirmBooking["BOOKING_TYPE"]=typeCt.text;
      confirmBooking["BOOKING_DESCRIPTION"]=descrCt.text;
      confirmBooking["BOOKING_STATUS"]="PENDING";

      db.collection("BOOKINGS").doc(id).set(confirmBooking,SetOptions(merge: true));
      descrCt.clear();
      timeCt.clear();
      typeCt.clear();
      notifyListeners();

    } catch (e) {
      print("Failed to confirm booking: $e");
    }
  }

  List<AdminBookingModel> adminBookingList = [];
  List<AdminBookingModel> adminConfirmBookingList = [];
  List<AdminBookingModel> adminHistoryBookingList = [];
  List<AdminBookingModel> filterAdminHistoryBookingList = [];
  List<AdminBookingModel> filterMyBookingList = [];

  Future<void> getAllBookings() async {
    // Clear the current list
    adminBookingList.clear();

    try {
      // Fetch bookings from Firestore
      QuerySnapshot value = await db.collection("BOOKINGS").where("BOOKING_STATUS",isEqualTo: "PENDING").get();

      if (value.docs.isNotEmpty) {
        // Loop through all documents and add them to the booking list
        for (var element in value.docs) {
          Map<String, dynamic> map = element.data() as Map<String, dynamic>;

          adminBookingList.add(AdminBookingModel(
            element.id,
            map["BOOKING_PERSON"] ?? "",
            map["BOOKING_DATE"] ?? "",
            map["BOOKING_ADDRESS"] ?? "",
            map["BOOKING_PLACE"] ?? "",
            map["BOOKING_CITY"] ?? "",
            map["BOOKING_DISTRICT"] ?? "",
            map["BOOKING_STATE"] ?? "",
            map["BOOKING_PHONE"] ?? "",
            map["BOOKING_TYPE"] ?? "",
            map["BOOKING_DESCRIPTION"] ?? "",
            map["BOOKING_MODEL"] ?? "",
            map["BOOKING_STATUS"] ?? "",
          ));
        }
      }

      // Notify listeners to update the UI
      print(adminBookingList.length.toString()+"jjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      notifyListeners();
    } catch (e) {
      print("Error fetching bookings: $e");
      // Handle error here, like showing a Snackbar or alert in the UI
    }
  }

  Future<void> getHistoryBookings() async {
    // Clear the current list
    adminHistoryBookingList.clear();

    try {
      // Fetch bookings from Firestore
      QuerySnapshot value = await db.collection("BOOKINGS").where("BOOKING_STATUS",whereIn:[ "REJECT","COMPLETE"]).get();

      if (value.docs.isNotEmpty) {
        // Loop through all documents and add them to the booking list
        for (var element in value.docs) {
          Map<String, dynamic> map = element.data() as Map<String, dynamic>;

          adminHistoryBookingList.add(AdminBookingModel(
            element.id,
            map["BOOKING_PERSON"] ?? "",
            map["BOOKING_DATE"] ?? "",
            map["BOOKING_ADDRESS"] ?? "",
            map["BOOKING_PLACE"] ?? "",
            map["BOOKING_CITY"] ?? "",
            map["BOOKING_DISTRICT"] ?? "",
            map["BOOKING_STATE"] ?? "",
            map["BOOKING_PHONE"] ?? "",
            map["BOOKING_TYPE"] ?? "",
            map["BOOKING_DESCRIPTION"] ?? "",
            map["BOOKING_MODEL"] ?? "",
            map["BOOKING_STATUS"] ?? "",
          ));
        }
      }
      filterAdminHistoryBookingList=adminHistoryBookingList;

      // Notify listeners to update the UI
      print(adminHistoryBookingList.length.toString()+"jjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      notifyListeners();
    } catch (e) {
      print("Error fetching bookings: $e");
      // Handle error here, like showing a Snackbar or alert in the UI
    }
  }

  Future<void> getMyBookings(String id) async {
    // Clear the current list
    filterMyBookingList.clear();

    try {
      // Fetch bookings from Firestore
      QuerySnapshot value = await db.collection("BOOKINGS").where("USER_ID",isEqualTo:id).get();

      if (value.docs.isNotEmpty) {
        // Loop through all documents and add them to the booking list
        for (var element in value.docs) {
          Map<String, dynamic> map = element.data() as Map<String, dynamic>;

          filterMyBookingList.add(AdminBookingModel(
            element.id,
            map["BOOKING_PERSON"] ?? "",
            map["BOOKING_DATE"] ?? "",
            map["BOOKING_ADDRESS"] ?? "",
            map["BOOKING_PLACE"] ?? "",
            map["BOOKING_CITY"] ?? "",
            map["BOOKING_DISTRICT"] ?? "",
            map["BOOKING_STATE"] ?? "",
            map["BOOKING_PHONE"] ?? "",
            map["BOOKING_TYPE"] ?? "",
            map["BOOKING_DESCRIPTION"] ?? "",
            map["BOOKING_MODEL"] ?? "",
            map["BOOKING_STATUS"] ?? "",
          ));
        }
      }
      // filterAdminHistoryBookingList=adminHistoryBookingList;

      // Notify listeners to update the UI
      print(adminHistoryBookingList.length.toString()+"jjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      notifyListeners();
    } catch (e) {
      print("Error fetching bookings: $e");
      // Handle error here, like showing a Snackbar or alert in the UI
    }
  }

  searchFunction(String item){
    
    filterAdminHistoryBookingList=adminHistoryBookingList.where((element) =>(
    element.Phonenumber.toLowerCase().contains(item.toLowerCase())||
        element.model.toLowerCase().contains(item.toLowerCase())||
        element.Place.toLowerCase().contains(item.toLowerCase())
    )).toList();
    notifyListeners();
  }

  confmBooking(String id){
    db.collection("BOOKINGS").doc(id).set({"BOOKING_STATUS":"CONFIRM"},SetOptions(merge: true));
    adminBookingList.removeWhere((element)=>element.id == id);
  }

  Future<void> getConfirmBookings() async {
    // Clear the current list
    adminConfirmBookingList.clear();

    try {
      // Fetch bookings from Firestore
      QuerySnapshot value = await db.collection("BOOKINGS").where("BOOKING_STATUS",isEqualTo: "CONFIRM").get();

      if (value.docs.isNotEmpty) {
        // Loop through all documents and add them to the booking list
        for (var element in value.docs) {
          Map<String, dynamic> map = element.data() as Map<String, dynamic>;

          adminConfirmBookingList.add(AdminBookingModel(
            element.id,
            map["BOOKING_PERSON"] ?? "",
            map["BOOKING_DATE"] ?? "",
            map["BOOKING_ADDRESS"] ?? "",
            map["BOOKING_PLACE"] ?? "",
            map["BOOKING_CITY"] ?? "",
            map["BOOKING_DISTRICT"] ?? "",
            map["BOOKING_STATE"] ?? "",
            map["BOOKING_PHONE"] ?? "",
            map["BOOKING_TYPE"] ?? "",
            map["BOOKING_DESCRIPTION"] ?? "",
            map["BOOKING_MODEL"] ?? "",
            map["BOOKING_STATUS"] ?? "",
          ));
        }
      }

      // Notify listeners to update the UI
      print(adminConfirmBookingList.length.toString()+"jjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      notifyListeners();
    } catch (e) {
      print("Error fetching bookings: $e");
      // Handle error here, like showing a Snackbar or alert in the UI
    }
  }

  completeBooking(String id){
    db.collection("BOOKINGS").doc(id).set({"BOOKING_STATUS":"COMPLETE"},SetOptions(merge: true));
    adminConfirmBookingList.removeWhere((element)=>element.id == id);
    notifyListeners();
  }

  rejectConBooking(String id){
    db.collection("BOOKINGS").doc(id).set({"BOOKING_STATUS":"REJECT"},SetOptions(merge: true));
    adminConfirmBookingList.removeWhere((element)=>element.id == id);
    notifyListeners();
  }

  rejectBooking(String id){
    db.collection("BOOKINGS").doc(id).set({"BOOKING_STATUS":"REJECT"},SetOptions(merge: true));
    adminBookingList.removeWhere((element)=>element.id == id);
    notifyListeners();
  }


  Future<void> confirmOrder(List<cartDetails> cartList, double deliveryPrice,String userId) async {
    if (selectedAddress == null) {
      throw Exception("No address selected");
    }

    try {
      String id = DateTime.now().millisecondsSinceEpoch.toString();
      double subtotal = cartList.fold(0, (sum, item) => sum + double.parse(item.TotalPrice));
      double grandTotal = subtotal + deliveryPrice;
      String formattedDate=DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
      HashMap<String, dynamic> confirmOrder = HashMap();
      confirmOrder["ORDER_ID"] = id;
      confirmOrder["USER_ID"] = userId;
      confirmOrder["ORDER_PERSON"] = selectedAddress!.Name;
      confirmOrder["ORDER_DATE"] = formattedDate;
      confirmOrder["ORDER_ADDRESS"] = selectedAddress!.Address;
      confirmOrder["ORDER_PLACE"] = selectedAddress!.Place;
      confirmOrder["ORDER_CITY"] = selectedAddress!.City;
      confirmOrder["ORDER_DISTRICT"] = selectedAddress!.District;
      confirmOrder["ORDER_STATE"] = selectedAddress!.State;
      confirmOrder["ORDER_PHONE"] = selectedAddress!.Phonenumber;
      confirmOrder["ORDER_STATUS"] = "PENDING";
      confirmOrder["ORDER_SUBTOTAL"] = subtotal.toStringAsFixed(2);
      confirmOrder["ORDER_DELIVERY"] = deliveryPrice.toStringAsFixed(2);
      confirmOrder["ORDER_GRAND_TOTAL"] = grandTotal.toStringAsFixed(2);

      await db.collection("ORDER").doc(id).set(confirmOrder, SetOptions(merge: true));

      for (var item in cartList) {
        HashMap<String, dynamic> cartItemMap = HashMap();
        cartItemMap["PRODUCT_NAME"] = item.Name;
        cartItemMap["PRODUCT_PHOTO"] = item.Photo;
        cartItemMap["QUANTITY"] = item.qty;
        cartItemMap["TOTAL_PRICE"] = item.TotalPrice;

        await db.collection("ORDER").doc(id).collection("ITEMS").add(cartItemMap);
      }
      cartList.clear();

      await deleteCartByUserId(userId);
      notifyListeners();


      print("Order and items successfully added to the database.");

    } catch (e) {
      print("Failed to confirm order: $e");
    }
  }

  List<AdminOrderModel> adminOrderList = [];
  List<AdminOrderModel> adminConfirmedOrderList = [];
  List<AdminOrderModel> adminHistoryOrderList = [];
  List<AdminOrderModel> filterAdminHistoryOrderList = [];
  List<AdminOrderModel> filterMyOrderList = [];


  Future<void> getAllOrder() async {
    adminOrderList.clear();

    try {
      QuerySnapshot orderSnapshot = await db.collection("ORDER").where("ORDER_STATUS", isEqualTo: "PENDING").get();

      if (orderSnapshot.docs.isNotEmpty) {
        for (var orderDoc in orderSnapshot.docs) {
          Map<String, dynamic> orderMap = orderDoc.data() as Map<String, dynamic>;
          QuerySnapshot itemSnapshot = await db.collection("ORDER").doc(orderDoc.id).collection("ITEMS").get();
          List<OrderItem> orderItems = itemSnapshot.docs.map((itemDoc) {
            Map<String, dynamic> itemMap = itemDoc.data() as Map<String, dynamic>;
            return OrderItem(
              productName: itemMap['PRODUCT_NAME'] ?? '',
              productPhoto: itemMap['PRODUCT_PHOTO'] ?? '',
              quantity: itemMap['QUANTITY'] ?? "",
              totalPrice: itemMap['TOTAL_PRICE'] ?? '0.00',
            );
          }).toList();
          adminOrderList.add(AdminOrderModel(
            orderDoc.id,
            orderMap["ORDER_PERSON"] ?? "",
            orderMap["ORDER_DATE"] ?? "",
            orderMap["ORDER_ADDRESS"] ?? "",
            orderMap["ORDER_PLACE"] ?? "",
            orderMap["ORDER_CITY"] ?? "",
            orderMap["ORDER_DISTRICT"] ?? "",
            orderMap["ORDER_STATE"] ?? "",
            orderMap["ORDER_PHONE"] ?? "",
            orderMap["ORDER_STATUS"] ?? "",
            orderMap["ORDER_SUBTOTAL"] ?? "",
            orderMap["ORDER_DELIVERY"] ?? "",
            orderMap["ORDER_GRAND_TOTAL"] ?? "",
            orderItems, // Add the items here
          ));
        }
      }

      print("${adminOrderList.length} pending orders with items fetched.");
      notifyListeners();
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }
  Future<void> getMyOrder(String id) async {
    filterMyOrderList.clear();

    try {
      QuerySnapshot orderSnapshot = await db.collection("ORDER").where("USER_ID", isEqualTo:id).get();

      if (orderSnapshot.docs.isNotEmpty) {
        for (var orderDoc in orderSnapshot.docs) {
          Map<String, dynamic> orderMap = orderDoc.data() as Map<String, dynamic>;
          QuerySnapshot itemSnapshot = await db.collection("ORDER").doc(orderDoc.id).collection("ITEMS").get();
          List<OrderItem> orderItems = itemSnapshot.docs.map((itemDoc) {
            Map<String, dynamic> itemMap = itemDoc.data() as Map<String, dynamic>;
            return OrderItem(
              productName: itemMap['PRODUCT_NAME'] ?? '',
              productPhoto: itemMap['PRODUCT_PHOTO'] ?? '',
              quantity: itemMap['QUANTITY'] ?? "",
              totalPrice: itemMap['TOTAL_PRICE'] ?? '0.00',
            );
          }).toList();
          filterMyOrderList.add(AdminOrderModel(
            orderDoc.id,
            orderMap["ORDER_PERSON"] ?? "",
            orderMap["ORDER_DATE"] ?? "",
            orderMap["ORDER_ADDRESS"] ?? "",
            orderMap["ORDER_PLACE"] ?? "",
            orderMap["ORDER_CITY"] ?? "",
            orderMap["ORDER_DISTRICT"] ?? "",
            orderMap["ORDER_STATE"] ?? "",
            orderMap["ORDER_PHONE"] ?? "",
            orderMap["ORDER_STATUS"] ?? "",
            orderMap["ORDER_SUBTOTAL"] ?? "",
            orderMap["ORDER_DELIVERY"] ?? "",
            orderMap["ORDER_GRAND_TOTAL"] ?? "",
            orderItems, // Add the items here
          ));
        }
      }

      print("${adminOrderList.length} pending orders with items fetched.");
      notifyListeners();
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }

  Future<void> getHistoryOrder() async {
    adminHistoryOrderList.clear();

    try {
      QuerySnapshot orderSnapshot = await db.collection("ORDER").where("ORDER_STATUS", whereIn: ["CANCEL","SHIPPED"]).get();

      if (orderSnapshot.docs.isNotEmpty) {

        for (var orderDoc in orderSnapshot.docs) {
          Map<String, dynamic> orderMap = orderDoc.data() as Map<String, dynamic>;
          QuerySnapshot itemSnapshot = await db.collection("ORDER").doc(orderDoc.id).collection("ITEMS").get();
          List<OrderItem> orderItems = itemSnapshot.docs.map((itemDoc) {
            Map<String, dynamic> itemMap = itemDoc.data() as Map<String, dynamic>;
            return OrderItem(
              productName: itemMap['PRODUCT_NAME'] ?? '',
              productPhoto: itemMap['PRODUCT_PHOTO'] ?? '',
              quantity: itemMap['QUANTITY'] ?? "",
              totalPrice: itemMap['TOTAL_PRICE'] ?? '0.00',
            );
          }).toList();
          adminHistoryOrderList.add(AdminOrderModel(
            orderDoc.id,
            orderMap["ORDER_PERSON"] ?? "",
            orderMap["ORDER_DATE"] ?? "",
            orderMap["ORDER_ADDRESS"] ?? "",
            orderMap["ORDER_PLACE"] ?? "",
            orderMap["ORDER_CITY"] ?? "",
            orderMap["ORDER_DISTRICT"] ?? "",
            orderMap["ORDER_STATE"] ?? "",
            orderMap["ORDER_PHONE"] ?? "",
            orderMap["ORDER_STATUS"] ?? "",
            orderMap["ORDER_SUBTOTAL"] ?? "",
            orderMap["ORDER_DELIVERY"] ?? "",
            orderMap["ORDER_GRAND_TOTAL"] ?? "",
            orderItems, // Add the items here
          ));
        }
      }

      filterAdminHistoryOrderList=adminHistoryOrderList;

      print("${adminHistoryOrderList.length} pending orders with items fetched.");
      notifyListeners();
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }

  searchFunction2(String item){

    filterAdminHistoryOrderList=adminHistoryOrderList.where((element) =>(
        element.orderPhone.toLowerCase().contains(item.toLowerCase())||
            element.orderPerson.toLowerCase().contains(item.toLowerCase())||
            element.orderDate.toLowerCase().contains(item.toLowerCase())
    )).toList();
    notifyListeners();
  }

  Future<void> getConfirmdeOrder() async {
    adminConfirmedOrderList.clear();

    try {
      QuerySnapshot orderSnapshot = await db.collection("ORDER").where("ORDER_STATUS", isEqualTo: "CONFIRM").get();

      if (orderSnapshot.docs.isNotEmpty) {
        for (var orderDoc in orderSnapshot.docs) {
          Map<String, dynamic> orderMap = orderDoc.data() as Map<String, dynamic>;
          QuerySnapshot itemSnapshot = await db.collection("ORDER").doc(orderDoc.id).collection("ITEMS").get();
          List<OrderItem> orderItems = itemSnapshot.docs.map((itemDoc) {
            Map<String, dynamic> itemMap = itemDoc.data() as Map<String, dynamic>;
            return OrderItem(
              productName: itemMap['PRODUCT_NAME'] ?? '',
              productPhoto: itemMap['PRODUCT_PHOTO'] ?? '',
              quantity: itemMap['QUANTITY'] ?? "",
              totalPrice: itemMap['TOTAL_PRICE'] ?? '0.00',
            );
          }).toList();
          adminConfirmedOrderList.add(AdminOrderModel(
            orderDoc.id,
            orderMap["ORDER_PERSON"] ?? "",
            orderMap["ORDER_DATE"] ?? "",
            orderMap["ORDER_ADDRESS"] ?? "",
            orderMap["ORDER_PLACE"] ?? "",
            orderMap["ORDER_CITY"] ?? "",
            orderMap["ORDER_DISTRICT"] ?? "",
            orderMap["ORDER_STATE"] ?? "",
            orderMap["ORDER_PHONE"] ?? "",
            orderMap["ORDER_STATUS"] ?? "",
            orderMap["ORDER_SUBTOTAL"] ?? "",
            orderMap["ORDER_DELIVERY"] ?? "",
            orderMap["ORDER_GRAND_TOTAL"] ?? "",
            orderItems, // Add the items here
          ));
        }
      }

      print("${adminConfirmedOrderList.length} pending orders with items fetched.");
      notifyListeners();
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }

  conOrder(String id){
    db.collection("ORDER").doc(id).set({"ORDER_STATUS":"CONFIRM"},SetOptions(merge: true));
    adminOrderList.removeWhere((element)=>element.orderId == id);
    notifyListeners();
  }

  shippedOrder(String id){
    db.collection("ORDER").doc(id).set({"ORDER_STATUS":"SHIPPED"},SetOptions(merge: true));
    adminConfirmedOrderList.removeWhere((element)=>element.orderId == id);
    notifyListeners();
  }

  cancelOrder(String id){
    db.collection("ORDER").doc(id).set({"ORDER_STATUS":"CANCEL"},SetOptions(merge: true));
    adminOrderList.removeWhere((element)=>element.orderId == id);
    notifyListeners();
  }



  Future<void> deleteCartByUserId(String userId) async {
    try {
      QuerySnapshot cartItemsSnapshot = await db.collection("CART")
          .where("USER_ID", isEqualTo: userId)
          .get();

      for (var doc in cartItemsSnapshot.docs) {
        await db.collection("CART").doc(doc.id).delete();
      }

      print("All cart items for user $userId have been successfully deleted.");
    } catch (e) {
      print("Error deleting cart items for user $userId: $e");
    }
  }








  List <BookingModel> bookinglist = [];

  //------------------- get post image --------------
   getBooking(String userId){
    db.collection("ADDRESS").where("CUSTOMER_ID",isEqualTo: userId).get().then((value){
      if(value.docs.isNotEmpty){
        bookinglist.clear();
        for(var element in value.docs){
          bookinglist.add(BookingModel(
              element.id,
              element.get("NAME").toString(),
              element.get("TIME").toString(),
              element.get("ADDRESS").toString(),
              element.get("PLACE").toString(),
              element.get("CITY").toString(),
              element.get("DISTRICT").toString(),
              element.get("STATE").toString(),
              element.get("PHONE_NUMBER").toString(),
              element.get("TYPE").toString(),
              element.get("DESCRIPTION").toString(),
              ));
          notifyListeners();
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }
  //--------------clear---image
  void clearBooking() {
    nameCt.clear();
    timeCt.clear();
    addressCt.clear();
    placeCt.clear();
    cityCt.clear();
    districtCt.clear();
    stateCt.clear();
    phonenumberCt.clear();
    typeCt.clear();
    descrCt.clear();

  }

//---------delete----------
  void DeleteBooking(id, BuildContext context) {
    db.collection("BOOKING").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Succesfully"),
        ));
  }

  //----------edit-----*+
  void EditBooking(String id) {
    db.collection("BOOKING").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> addmap = value.data() as Map;
        nameCt.text = addmap["NAME"].toString();
        timeCt.text = addmap["TIME"].toString();
        addressCt.text = addmap["ADDRESS"].toString();
        placeCt.text = addmap["PLACE"].toString();
        cityCt.text = addmap["CITY"].toString();
        districtCt.text = addmap["DISTRICT"].toString();
        stateCt.text = addmap["STATE"].toString();
        phonenumberCt = addmap["PHONE_NUMBER"];
        typeCt = addmap["TYPE"];
        descrCt = addmap["DESCRIPTION"];
        getBooking("");
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();

  }

  Future<void> deleteAddress(String bookingId,String userId) async {
    await db.collection("BOOKING").doc(bookingId).delete();

    if (selectedAddress?.id == bookingId) {
      selectedAddress = null;
    }

    await getBooking(userId);
    notifyListeners();
  }

  TextEditingController emailCt = TextEditingController();
  TextEditingController name2Ct = TextEditingController();
  TextEditingController address2Ct = TextEditingController();
  TextEditingController state2Ct = TextEditingController();
  TextEditingController district2Ct = TextEditingController();
  TextEditingController city2Ct = TextEditingController();
  TextEditingController phonenumber2Ct = TextEditingController();
  TextEditingController zipcodeCt = TextEditingController();

  // File? FileImage;

  Future<void> addShopOrder(String from,String oldid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, dynamic> addmap = HashMap();
    addmap["SHOP_ID"]=id;
    addmap["SHOPEMAIL"] = emailCt.text;
    addmap["SHOPNAME"] = name2Ct.text;
    addmap["SHOPADDRESS"] = address2Ct.text;
    addmap["SHOPPLACE"] = state2Ct.text;
    addmap["SHOPDISTRICT"] = district2Ct.text;
    addmap["SHOPCITY"] = city2Ct.text;
    addmap["SHOPPHONENUMBER"] = phonenumber2Ct.text;
    addmap["SHOPZIPCODE"] = zipcodeCt.text;
    if (from == "NEW") {
      addmap["SHOP_ID"] = id;
    }
    if (from == "EDIT") {
      db.collection("SHOP").doc(oldid).update(addmap);
    } else {
      db.collection("SHOP").doc(id).set(addmap);
    }
    print("sabhkajsdl");

    // if (productFileImage != null) {
    //   print("njsbcd");
    //   String photoId = DateTime.now().millisecondsSinceEpoch.toString();
    //   ref = FirebaseStorage.instance.ref().child('Images').child(photoId);
    //
    //   try {
    //     await ref.putFile(productFileImage!).whenComplete(() async {
    //       print("Upload complete: " + productFileImage!.toString());
    //
    //       await ref.getDownloadURL().then((value1) {
    //         map["PHOTO"] = value1;
    //         print("Download URL obtained: " + value1);
    //         notifyListeners();
    //       }).catchError((error) {
    //         print("Error getting download URL: " + error.toString());
    //       });
    //
    //       notifyListeners();
    //     }).catchError((error) {
    //       print("Error during upload: " + error.toString());
    //     });
    //   } catch (e) {
    //     print("Caught error: " + e.toString());
    //   }
    //
    //   notifyListeners();
    // }
    // else {
    //   print("imhere" + productFileImage!.toString());
    //   print("heloooooioi");
    //   map["PHOTO"]=productimg;
    // }
    // if (from == "EDIT") {
    //   db.collection("PRODUCT_IMAGE").doc(oldid).update(map);
    // } else {
    //   db.collection("PRODUCT_IMAGE").doc(id).set(map);
    // }
    // print("herealso"+productFileImage!.toString());
    //
    // getProductImage();
    // notifyListeners();
  }

  // Future getBookingImggallery() async {
  //   final imagePicker = ImagePicker();
  //   final pickedImage =
  //   await imagePicker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedImage != null) {
  //     cropProductImage(pickedImage.path, "");
  //   } else {
  //     print('No image selected.');
  //
  //
  //   }
  // }

  // Future getBookingImgcamera() async {
  //   final imgPicker = ImagePicker();
  //   final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);
  //
  //   if (pickedImage != null) {
  //     cropProductImage(pickedImage.path, "");
  //   } else {
  //     print('No image selected.');
  //   }
  //   notifyListeners();
  // }

  // Future<void> cropBookingImage(String path, String from) async {
  //   final croppedFile = await ImageCropper().cropImage(
  //     sourcePath: path,
  //     aspectRatioPresets: Platform.isAndroid
  //         ? [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9,
  //     ]
  //         : [
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio5x3,
  //       CropAspectRatioPreset.ratio5x4,
  //       CropAspectRatioPreset.ratio7x5,
  //       CropAspectRatioPreset.ratio16x9,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: Colors.white,
  //           toolbarWidgetColor: Colors.black,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       IOSUiSettings(
  //         title: 'Cropper',
  //       )
  //     ],
  //   );
  //   if (croppedFile != null) {
  //     productFileImage = File(croppedFile.path);
  //     // print(Registerfileimg.toString() + "fofiifi");
  //
  //     notifyListeners();
  //   }
  // }



  List <ShopModel> shoplist = [];

  //------------------- get post image --------------
  void getShopOrder(){
    db.collection("SHOP").get().then((value){
      if(value.docs.isNotEmpty){
        shoplist.clear();
        for(var element in value.docs){
          shoplist.add(ShopModel(
            element.id,
            element.get("SHOPEMAIL").toString(),
            element.get("SHOPNAME").toString(),
            element.get("SHOPADDRESS").toString(),
            element.get("SHOPPLACE").toString(),
            element.get("SHOPDISTRICT").toString(),
            element.get("SHOPCITY").toString(),
            element.get("SHOPPHONENUMBER").toString(),
            element.get("SHOPZIPCODE").toString(),

          ));
          notifyListeners();
        }
        notifyListeners();
      }
    });
    notifyListeners();
  }
  //--------------clear---image
  void clearShoporder() {
    emailCt.clear();
    name2Ct.clear();
    address2Ct.clear();
    state2Ct.clear();
    district2Ct.clear();
    city2Ct.clear();
    phonenumber2Ct.clear();
    zipcodeCt.clear();


  }

//---------delete----------
  void DeleteShopOrder(id, BuildContext context) {
    db.collection("SHOP").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Succesfully"),
        ));
  }

  //----------edit-----*+
  void EditShopOrder(String id) {
    db.collection("SHOP").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> addmap = value.data() as Map;
        emailCt.text = addmap["SHOPEMAIL"].toString();
        name2Ct.text = addmap["SHOPNAME"].toString();
        address2Ct.text = addmap["SHOPADDRESS"].toString();
        state2Ct.text = addmap["SHOPSTATE"].toString();
        district2Ct.text = addmap["SHOPDISTRICT"].toString();
        city2Ct.text = addmap["SHOPCITY"].toString();
        phonenumber2Ct.text = addmap["SHOPPHONENUMBER"].toString();
        zipcodeCt = addmap["SHOPZIPCODE"];
        getShopOrder();
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();

  }

  void makePhoneCall(String phoneNumber) async {
    final Uri telUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  int? _selectedMethod;
  String _deliveryType = "";
  String deliPrice="";

  int? get selectedMethod => _selectedMethod;
  String get deliveryType => _deliveryType;

  void deliverySelect(int index, String title,String price) {
    _selectedMethod = index;
    _deliveryType = title;
    deliPrice=price;
    notifyListeners();
  }







}
