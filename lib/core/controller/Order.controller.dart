import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/models/CartModal.dart';
import 'package:restaurant_app/core/models/order.model.dart';
import 'package:restaurant_app/core/models/product.model.dart';
import 'package:restaurant_app/core/service/Order.service.dart';

class OrderController extends GetxController {
  addOrder(List<CartModal> item, int total) async {
    List<ProductsModel> productList = [];
    for (int i = 0; i < item.length; i++) {
      productList.add(item[i].product);
    }
    OrdersModel order = OrdersModel(
        products: productList,
        total: total.toString(),
        type: 'k',
        userId: 'kkkk',
        orderTime: DateTime.now());
    await OrderService()
        .addOrder(order, item[0].restorantId)
        .then((value) => print("order Added"))
        .catchError((error) => print("Failed to add order: $error"));
    update();
  }
}
