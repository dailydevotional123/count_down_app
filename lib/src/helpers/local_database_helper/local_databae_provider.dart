import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/log_utils.dart';
import 'drift_helper.dart';

class LocalDatabaseProvider extends ChangeNotifier {
  AppDataBase appDataBase = AppDataBase();

  //final dbHelper = LocalDatabaseHelper();

  // ///-------------------session section --------------------
  // addSession(SessionTableCompanion sessionTableCompanion) async {
  //   int status = await appDataBase.insertSession(sessionTableCompanion);
  //   dp(msg: "session add during login", arg: status);
  // }

  bool? isUserLoggedIn;

  // Future<bool> checkIfUserLoggedIn() async {
  //   bool status = await appDataBase.checkIfLoggedIn();
  //   isUserLoggedIn = status;
  //   notifyListeners();
  //   return status;
  // }

  // Future<int> logoutSession() async {
  //   int status = await appDataBase.logoutSession();
  //   showSuccessSnackBarMessage(message: "Logout Successfully");
  //   return status;
  // }

  ///-------------------user section --------------------

  List<UserData> userTableList = [];

  UserData? userTableData;

  getListOfUsers() async {
    userTableList = await appDataBase.getAllUsers();
    notifyListeners();
  }

  getIndividualUser(String userID) async {
    userTableData = await appDataBase.getIndividualUsers(userID);
    notifyListeners();
  }

  addUser(UserCompanion userTableCompanion) async {
    int status = await appDataBase.insertUser(userTableCompanion);
    dp(msg: "user add during login", arg: status);
    getIndividualUser(userTableCompanion.userId.value);
    dp(msg: "single user data local", arg: userTableCompanion.toString());
  }

  ///-------------------cart section --------------------

  //List<CartTableData> cartItemList = [];

  Future<Uint8List> downloadImage(String imageUrl) async {
    try {
      final dio = Dio();
      final response = await dio.get(imageUrl,
          options: Options(responseType: ResponseType.bytes));

      if (response.statusCode == 200) {
        dp(msg: "image download response data", arg: response.data.toString());
        // Convert the response body (bytes) to Uint8List
        return Uint8List.fromList(response.data);
      } else {
        // Handle the case when the request fails or returns a non-200 status code
        throw Exception('Failed to load image');
      }
    } catch (e) {
      // Handle any errors that occurred during the HTTP request
      print('Error downloading image: $e');
      rethrow; // Rethrow the error to propagate it
    }
  }

  // addToCartProvider(CartTableCompanion cartCompanion) async {
  //   bool status =
  //       await appDataBase.doesCartItemExist(cartCompanion.productId.value);
  //   dp(msg: "cart item exist status", arg: status.toString());
  //   if (status == false) {
  //     showSuccessSnackBarMessage(
  //       message: "Item Already Exists In Cart",
  //     );
  //   } else {
  //     int status = await appDataBase.addToCart(cartCompanion);
  //     showSuccessSnackBarMessage(
  //       message: "Item added to cart successfully",
  //     );
  //     dp(msg: "add to cart insert status", arg: status);
  //   }

  // int status = await appDataBase.addToCart(cartCompanion);
  // dp(msg: "add to cart insert status", arg: status);

  //   getListOfItemsOfCard();
  //   notifyListeners();
  // }

  var totalPriceVar = 0.0;

// getListOfItemsOfCard() async {
//   cartItemList = await appDataBase.getAllCartItems();
//   if (cartItemList.isNotEmpty) {
//     //     return cartItemList.fold(0.0, (double total, Product product) => total + product.price);
//     var totalPrice = cartItemList.fold(
//         0.0,
//         (previousValue, element) =>
//             previousValue + element.productPrice * element.productQuantity);
//     dp(msg: "Total Price", arg: totalPrice.toString());
//     totalPriceVar = totalPrice;
//   } else if (cartItemList.isEmpty) {
//     totalPriceVar = 0.0;
//   }
//   notifyListeners();
// }

// deleteCartItemProvider(int id) async {
//   int status = await appDataBase.deleteCartItem(id);
//   dp(msg: "delete cart item status", arg: status);
//   getListOfItemsOfCard();
//   notifyListeners();
// }
//
// updateCartItemProvider(CartTableCompanion entity) async {
//   bool status = await appDataBase.updateCartItem(entity);
//   dp(msg: "update cart item status", arg: status);
//   getListOfItemsOfCard();
//   notifyListeners();
// }
}
