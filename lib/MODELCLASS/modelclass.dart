class PostModel {
  String id;
  String Photo;
  String Category;
  String Description;
  PostModel(this.id,this.Photo,this.Category,this.Description);
}
class AdvtModel {
  String id;
  String Photo;
  String Name;
  String Price;
  String Description;
  AdvtModel(this.id,this.Photo,this.Price,this.Name,this.Description);
}
class ProductModel {
  String id;
  String Photo;
  String Name;
  String Price;
  String Prodescription;
  ProductModel(this.id,this.Photo,this.Name,this.Price,this.Prodescription,);
}
class FeedModel {
  String id;
  String Photo;
  String Name;
  String Link;
  String Description;
  FeedModel(this.id,this.Photo,this.Name,this.Link,this.Description);
}


class cartDetails {
  String id;
  String Photo;
  String Name;
  String Price;
  String TotalPrice;
  String grandTotalPrice;
  String qty;
  String userId;
  int count;



  cartDetails(this.id,this.Photo,this.Name,this.Price,this.TotalPrice,this.grandTotalPrice,this.qty,this.userId,this.count,);
}

class usermodelclass {

  String id;
  String username;
  String Number;


  usermodelclass(this.id,this.username,this.Number);

}
class ProfileModel {

  String id;
  String username;
  String photo;


  ProfileModel(this.id,this.username,this.photo);

}
class UserImageModel {

  String id;
  String photo;
  String userid;



  UserImageModel(this.id,this.photo,this.userid);

}

class BookingModel {
  String id;
  String Name;
  String Time;
  String Address;
  String Place;
  String City;
  String District;
  String State;
  String Phonenumber;
  String Type;
  String Desc;
  BookingModel(this.id,this.Name,this.Time,this.Address,this.Place,this.City,this.District,this.State,
      this.Phonenumber,this.Type,this.Desc);
}
class ShopModel {
  String id;
  String Email;
  String Name2;
  String Address2;
  String State2;
  String District2;
  String City2;
  String Phonenumber2;
  String Zipcode;

  ShopModel(this.id,this.Email,this.Name2,this.Address2,this.State2,this.District2,this.City2,this.Phonenumber2,
      this.Zipcode,);
}

class AdminBookingModel {
  String id;
  String Name;
  String Time;
  String Address;
  String Place;
  String City;
  String District;
  String State;
  String Phonenumber;
  String Type;
  String Desc;
  String model;
  String status;
  AdminBookingModel(this.id,this.Name,this.Time,this.Address,this.Place,this.City,this.District,this.State,
      this.Phonenumber,this.Type,this.Desc,this.model,this.status,);
}

class OrderItem {
  final String productName;
  final String productPhoto;
  final String quantity;
  final String totalPrice;

  OrderItem({
    required this.productName,
    required this.productPhoto,
    required this.quantity,
    required this.totalPrice,
  });
}

class AdminOrderModel {
  final String orderId;
  final String orderPerson;
  final String orderDate;
  final String orderAddress;
  final String orderPlace;
  final String orderCity;
  final String orderDistrict;
  final String orderState;
  final String orderPhone;
  final String orderStatus;
  final String orderSubtotal;
  final String orderDelivery;
  final String orderGrandTotal;
  final List<OrderItem> orderItems; // List of order items

  AdminOrderModel(
      this.orderId,
      this.orderPerson,
      this.orderDate,
      this.orderAddress,
      this.orderPlace,
      this.orderCity,
      this.orderDistrict,
      this.orderState,
      this.orderPhone,
      this.orderStatus,
      this.orderSubtotal,
      this.orderDelivery,
      this.orderGrandTotal,
      this.orderItems, // Add items to the constructor
      );
}



// class cartItems {
//   String id;
//   String Photo;
//   String Name;
//   String Price;
//
//   cartDetails(this.id,this.Photo,this.Name,this.Price);
// }

