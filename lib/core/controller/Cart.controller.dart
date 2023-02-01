import 'package:get/get.dart';
import 'package:restaurant_app/core/models/Addition.model.dart';
import 'package:restaurant_app/core/models/CartModal.dart';

class CartController extends GetxController {
  List<ProductOrderModel> _cart = [];
  List<ProductOrderModel> get cartList => _cart;
  int Totalprice = 0;


  extrasAreEqual(List<AdditionsModel> extras1, List<AdditionsModel> extras2) {
    if (extras1.length != extras2.length) {
      return false;
    } else {
      for (var i = 0; i < extras1.length; i++) {
        if (extras1[i] != extras2[i]) {
          return false;
        }
      }
      return true;
    }
  }

  addToCart(ProductOrderModel product) {
    if (_cart.isEmpty) {
      _cart.add(product);
      Get.snackbar('', '1تم اضافة المنتج بنجاح ');
    } else {
      if (_cart[0].restorantId != product.restorantId) {
        Get.snackbar('خطا', 'لا يمكنك الطلب من مطعمين مختلفين في طلب واحد');
      } else {
        int index = _cart.indexWhere((element) =>
            (product.nameAR == product.nameAR) &&
            extrasAreEqual(product.addstions, product.addstions));
        if (index == -1) {
          _cart.add(product);
          Get.snackbar('', '2تم اضافة المنتج بنجاح ');
        } else {
          _cart[index].quantity = _cart[index].quantity + 1;
          Get.snackbar('', '3تم اضافة المنتج بنجاح ');
        }
      }
    }
    update();
  }

  increasQuantity(ProductOrderModel item) {
    var index = _cart.indexWhere((element) => element.nameEN == item.nameEN);
    _cart[index].quantity = _cart[index].quantity + 1;
    update();
  }

  decreasQuantity(ProductOrderModel item) {
    var index = _cart.indexWhere((element) => element.nameEN == item.nameEN);
    if (_cart[index].quantity != 1) {
      _cart[index].quantity = _cart[index].quantity - 1;
    } else {
      _cart.remove(item);
    }
    update();
  }
}
