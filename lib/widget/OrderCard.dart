import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/models/order.model.dart';
import 'package:restaurant_app/widget/OrderDetils.dart';

class OrderCard extends StatelessWidget {
  const OrderCard(
      {super.key,
      required this.orderId,
      required this.btntext,
      required this.value,
      required this.isbtn,
      required this.order});
  final String orderId;
  final String btntext;
  final Function value;
  final bool isbtn;
  final OrdersModel order;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
          children: [
            Row(
              children: [
                Text('رقم الطلب: $orderId'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'تفاصيل الطلب',
                        content: OrderDetils(order: order));
                    },
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.amber[400],
                    )),
                (isbtn
                    ? ElevatedButton(
                        onPressed: () {
                          value();
                        },
                        child: Text(btntext))
                    : const SizedBox()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
