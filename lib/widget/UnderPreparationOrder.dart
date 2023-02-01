import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Order.controller.dart';
import 'package:restaurant_app/widget/OrderCard.dart';

class UnderPreparationOrder extends StatelessWidget {
  const UnderPreparationOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<AcceptOrderController>(
        init: Get.put(AcceptOrderController()),
        builder: ((controller) {
          if (controller.acceptOrderstrem != null) {
            return ListView.builder(
                itemCount: controller.acceptOrderstrem.length,
                itemBuilder: (context, index) => OrderCard(
                      orderId: controller.acceptOrderstrem[index].id,
                      btntext: 'جاهز للاستلام',
                      value: () {
                        controller.orderUpdata(
                            controller.acceptOrderstrem[index].id, 'ready');
                      },
                      isbtn: true,
                      order: controller.acceptOrderstrem[index],
                    ));
          } else {
            return Text("loading...");
          }
        }));
  }
}
