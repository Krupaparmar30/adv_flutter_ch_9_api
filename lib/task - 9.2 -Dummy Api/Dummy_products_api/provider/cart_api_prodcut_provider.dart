// import 'package:flutter/widgets.dart';
//
// import '../view/prodcut_api_details_page/prodcut_api_details_page.dart';
//
// class CartProvider extends ChangeNotifier {
//   double price = 0;
//   double discount = 0;
//   int quantity = 1;
//
//   void addQty(int index) {
//     qty[index]++;
//     notifyListeners();
//   }
//
//   void removeQty(int index) {
//     if (qty[index] > 0) {
//       qty[index]--;
//       notifyListeners();
//     }
//   }
//
//   void removeFromCart(int index) {
//     price -= cartList[index].price;
//     cartList.removeAt(index);
//     qty[index] = 1;
//     notifyListeners();
//   }
//
//   void discountedPrice() {
//     for (int i = 0; i < cartList.length; i++) {
//       price += cartList[i].price;
//     }
//     notifyListeners();
//   }
//
//   void totalPrice() {
//     for (int i = 0; i < cartList.length; i++) {
//       discount = cartList[i].discountPercentage + cartList[i].price;
//       quantity += qty[i];
//     }
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';

import '../view/prodcut_api_details_page/prodcut_api_details_page.dart';


class CartProvider extends ChangeNotifier {
  double price = 0;
  double discount = 0;
  int quantity = 1;

  void addQty(int index) {
    qty[index]++;
    notifyListeners();
  }

  void removeQty(int index) {
    if (qty[index] > 0) {
      qty[index]--;
      notifyListeners();
    }
  }

  void removeFromCart(int index) {
    price -= cartList[index].price;
    cartList.removeAt(index);
    qty[index] = 1;
    notifyListeners();
  }

  void discountedPrice() {
    for (int i = 0; i < cartList.length; i++) {
      price += cartList[i].price;
    }
    notifyListeners();
  }

  void totalPrice() {
    for (int i = 0; i <cartList.length; i++) {
      discount = cartList[i].discountPercentage + cartList[i].price;
      quantity += qty[i];
    }
    notifyListeners();
  }
}

