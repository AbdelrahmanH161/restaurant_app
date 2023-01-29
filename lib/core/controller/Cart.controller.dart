import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/models/Addition.model.dart';
import 'package:restaurant_app/core/models/CartModal.dart';
import 'package:restaurant_app/core/models/order.model.dart';

class CartController extends GetxController {
  List<CartModal> _cart = [];
  List<CartModal> get cartList => _cart;
  int Totalprice = 0;
  // CollectionReference _restaurant =
  //     FirebaseFirestore.instance.collection('Restaurants');

  bool extrasAreEqual(
      List<AdditionsModel> extras1, List<AdditionsModel> extras2) {
    if (extras1.length != extras2.length) return false;
    for (var i = 0; i < extras1.length; i++) {
      if (extras1[i].nameAR != extras2[i].nameAR) return false;
    }
    return true;
  }

  addToCart(CartModal cart) {
    if (_cart.isEmpty) {
      _cart.add(cart);
      Get.snackbar('', '1تم اضافة المنتج بنجاح ');
      Totalprice = cart.total;
    } else {
      if (_cart[0].restorantId != cart.restorantId) {
        Get.snackbar('خطا', 'لا يمكنك الطلب من مطعمين مختلفين في طلب واحد');
      } else {
        int index = _cart.indexWhere((element) =>
            element.product.nameEN == cart.product.nameEN &&
            extrasAreEqual(element.product.addstions, cart.product.addstions));
        if (index == -1) {
          _cart.add(cart);
          Get.snackbar('', '2تم اضافة المنتج بنجاح ');
          Totalprice = Totalprice + cart.total;
        } else {
          _cart[index].quantity = _cart[index].quantity + 1;
          Totalprice = Totalprice + _cart[index].total;
          Get.snackbar('', '3تم اضافة المنتج بنجاح ');
        }
      }
    }
    update();
  }

  increasQuantity(CartModal item) {
    var index = _cart
        .indexWhere((element) => element.product.nameEN == item.product.nameEN);
    _cart[index].quantity = _cart[index].quantity + 1;
    Totalprice = Totalprice + _cart[index].total;
    update();
  }

  decreasQuantity(CartModal item) {
    var index = _cart
        .indexWhere((element) => element.product.nameEN == item.product.nameEN);
    if (_cart[index].quantity != 1) {
      _cart[index].quantity = _cart[index].quantity - 1;
      Totalprice = Totalprice - _cart[index].total;
    } else {
      _cart.remove(item);
      Totalprice = Totalprice - item.total;
    }
    update();
  }
}
