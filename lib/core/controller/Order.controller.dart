import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/models/CartModal.dart';
import 'package:restaurant_app/core/models/order.model.dart';
import 'package:restaurant_app/core/service/Order.service.dart';

class OrderController extends GetxController {

  addOrder(List<ProductOrderModel> item, int total) async {
    OrdersModel order = OrdersModel(
        products: item,
        total: total.toString(),
        type: 'pending',
        userId: 'kkkk',
        orderTime: DateTime.now() as Timestamp);
    await OrderService()
        .addOrder(order, item[0].restorantId)
        .then((value) => print("order Added"))
        .catchError((error) => print("Failed to add order: $error"));
    update();
  }

  orderUpdata(String orderid, String value) async {
    await OrderService()
        .orderUpdata(orderid, value)
        .then((value) => print("order update"))
        .catchError((error) => print("Failed to update order: $error"));
  }
}

class NewOrderController extends GetxController {

  final newOrderList = <OrdersModel>[].obs;
  List<OrdersModel> get newOrderstrem => newOrderList.value;
  @override
  void onInit() {
    newOrderList.bindStream(OrderService().getNewOrderStream());
    super.onInit();
  }

    orderUpdata(String orderid, String value) async {
    await OrderService()
        .orderUpdata(orderid, value)
        .then((value) => print("order update"))
        .catchError((error) => print("Failed to update order: $error"));
  }

}

class AcceptOrderController extends GetxController{
  final acceptOrderList = <OrdersModel>[].obs;
  List<OrdersModel> get acceptOrderstrem => acceptOrderList.value;
  @override
  void onInit() {
    acceptOrderList.bindStream(OrderService().getacceptOrderStream());
    super.onInit();
  }


    orderUpdata(String orderid, String value) async {
    await OrderService()
        .orderUpdata(orderid, value)
        .then((value) => print("order update"))
        .catchError((error) => print("Failed to update order: $error"));
  }
}

class ReadyOrderController extends GetxController{
  final readyOrderList = <OrdersModel>[].obs;
  List<OrdersModel> get readyOrderstrem => readyOrderList.value;
  @override
  void onInit() {
    readyOrderList.bindStream(OrderService().getreadyOrderStream());
    super.onInit();
  }



    orderUpdata(String orderid, String value) async {
    await OrderService()
        .orderUpdata(orderid, value)
        .then((value) => print("order update"))
        .catchError((error) => print("Failed to update order: $error"));
  }
}

class FinishedOrderController extends GetxController{
  final finishedOrderList = <OrdersModel>[].obs;
  List<OrdersModel> get finishedOrderstrem => finishedOrderList.value;
  @override
  void onInit() {
    finishedOrderList.bindStream(OrderService().getfinishedOrderStream());
    super.onInit();
  }


    orderUpdata(String orderid, String value) async {
    await OrderService()
        .orderUpdata(orderid, value)
        .then((value) => print("order update"))
        .catchError((error) => print("Failed to update order: $error"));
  }
}
