import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Cart.controller.dart';
import 'package:restaurant_app/core/controller/Order.controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    CartController ctr = Get.put(CartController());
    OrderController ctrOrder = Get.put(OrderController());
    return Scaffold(
        appBar: AppBar(title: const Text('العربة')),
        body: Container(
          child: GetBuilder<CartController>(
            builder: ((controller) => Column(
                  children: [
                    Expanded(
                        child: ListView(
                      children: [
                        ...controller.cartList.map((e) {
                          return Card(
                            child: Row(
                              children: [
                                Image.network(
                                  e.product.image,
                                  width: 60,
                                ),
                                Column(
                                  children: [
                                    Text(e.product.nameAR),
                                    Row(
                                      children: [
                                        ...e.product.addstions
                                            .map((e) => Text(e.nameAR))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            controller.decreasQuantity(e);
                                          },
                                          icon: const Icon(Icons.minimize),
                                          padding:
                                              const EdgeInsets.only(bottom: 15),
                                        ),
                                        Text('${e.quantity}'),
                                        IconButton(
                                          onPressed: () {
                                            controller.increasQuantity(e);
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
                            builder: (controler) => ElevatedButton(
                              child: const Text('تاكيد الطلب'),
                              onPressed: () {
                                controler.addOrder(
                                    controller.cartList, controller.Totalprice);
                              },
                            ),
                          ),
                          Text('السعر : ${controller.Totalprice} الريال')
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
