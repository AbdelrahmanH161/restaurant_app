import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Order.controller.dart';
import 'package:restaurant_app/widget/OrderCard.dart';

class ReadyOrder extends StatelessWidget {
  const ReadyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ReadyOrderController>(
        init: Get.put(ReadyOrderController()),
        builder: ((controller) {
          if (controller != null && controller.readyOrderstrem != null) {
            return ListView.builder(
                itemCount: controller.readyOrderstrem.length,
                itemBuilder: (context, index) => OrderCard(
                      orderId: controller.readyOrderstrem[index].id,
                      btntext: 'تم التسليم',
                      value: () {
                        controller.orderUpdata(
                            controller.readyOrderstrem[index].id, 'finished');
                      },
                      isbtn: true,
                      order: controller.readyOrderstrem[index] ,
                    ));
          } else {
            return Text("loading...");
          }
        }));
  }
}
