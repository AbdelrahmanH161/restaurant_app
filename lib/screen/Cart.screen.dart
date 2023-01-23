import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Cart.controller.dart';
import 'package:restaurant_app/core/models/CartModal.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController crt = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(title: Text('العربة')),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: GetBuilder<CartController>(
                builder: ((controller) => ListView(
                      children: [
                        ...controller.cartList.map((e) => Text(e.restorantId))
                      ],
                    )))));
  }
}
