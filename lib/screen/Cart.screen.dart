import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Cart.controller.dart';
import 'package:restaurant_app/core/controller/Order.controller.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});
  final CartController controllercart = Get.find();
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('العربة')),
      body: Container(
          child: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              ...widget.controllercart.cartList.map((e) {
                return Card(
                  child: Row(
                    children: [
                      Image.network(
                        e.image,
                        width: 60,
                      ),
                      Column(
                        children: [
                          Text(e.nameAR),
                          Row(
                            children: [
                              ...e.addstions.map((e) => Text(e.nameAR))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  widget.controllercart.decreasQuantity(e);
                                },
                                icon: const Icon(Icons.minimize),
                                padding: const EdgeInsets.only(bottom: 15),
                              ),
                              Text('${e.quantity}'),
                              IconButton(
                                onPressed: () {
                                  widget.controllercart.increasQuantity(e);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              })
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetBuilder<OrderController>(
                  init: Get.put(OrderController()),
                  builder: (controler) => ElevatedButton(
                    child: const Text('تاكيد الطلب'),
                    onPressed: () {
                      // controler.addOrder(
                      //     controller.cartList, controller.Totalprice);
                    },
                  ),
                ),
                Text('السعر : ${widget.controllercart.Totalprice} الريال')
              ],
            ),
          )
        ],
      )),
    );
  }
}
