import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Order.controller.dart';
import 'package:restaurant_app/widget/OrderCard.dart';

class CompletedOrder extends StatelessWidget {
  const CompletedOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<FinishedOrderController>(
        init: Get.put(FinishedOrderController()),
        builder: ((controller) {
          if (controller != null && controller.finishedOrderstrem != null) {
            return ListView.builder(
                itemCount: controller.finishedOrderstrem.length,
                itemBuilder: (context, index) => OrderCard(
                      orderId: controller.finishedOrderstrem[index].id,
                      btntext: '',
                      value: () {},
                      isbtn: false,
                      order: controller.finishedOrderstrem[index] ,
                    ));
          } else {
            return Text("loading...");
          }
        }));
  }
}
