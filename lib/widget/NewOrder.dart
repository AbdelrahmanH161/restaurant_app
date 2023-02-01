import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Order.controller.dart';
import 'package:restaurant_app/widget/OrderCard.dart';

class NewOrder extends StatelessWidget {
  const NewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<NewOrderController>(
        init: Get.put(NewOrderController()),
        builder: ((controller) {
          if (controller != null && controller.newOrderstrem != null) {
            return ListView.builder(
                itemCount: controller.newOrderstrem.length,
                itemBuilder: (context, index) => OrderCard(
                      orderId: controller.newOrderstrem[index].id,
                      btntext: 'قبول الطلب',
                      value: () {
                        controller.orderUpdata(
                            controller.newOrderstrem[index].id, 'accept');
                      },
                      isbtn: true,
                      order: controller.newOrderstrem[index] ,
                    ));
          } else {
            return Text("loading...");
          }
        }));
  }
}
