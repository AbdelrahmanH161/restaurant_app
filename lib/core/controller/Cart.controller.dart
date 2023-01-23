import 'dart:convert';

import 'package:get/get.dart';
import 'package:restaurant_app/core/models/CartModal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  List<CartModal> cartList = [];

  CartController() {
    // getartList();
  }

  // getartList() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   cartList = json.decode(prefs.getString('cartList')) as List<CartModal>;
  // }

  addToCrat(CartModal product) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('cartList') == null) {
      cartList.add(product);
      prefs.setString('cartList', json.encode(cartList));
      // snap cart add scsses
    } else {
      if (product.restorantId == cartList[0].restorantId) {
        // snap shot dont order from to restourant
      } else {
        final index = cartList
            .indexWhere((element) => element.product.id == product.product.id);
        if (index == -1) {
          cartList.add(product);
          prefs.setString('cartList', json.encode(cartList));
          // snap cart add scsses
        } else {
          cartList[index].quantity = cartList[index].quantity + 1;
          // snap cart add scsses
        }
      }
    }
    update();
  }

  deleteFromCart(CartModal product) {
    cartList.removeWhere((element) => element.product.id == product.product.id);
  }

  increaseTheQuantity(CartModal product) {
    final item = cartList
        .firstWhere((element) => element.product.id == product.product.id);
    item.quantity = item.quantity + 1;
  }

  reduceTheQuantity(CartModal product) {
    final item = cartList
        .firstWhere((element) => element.product.id == product.product.id);
    item.quantity = item.quantity + 1;
  }
}
