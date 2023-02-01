import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:restaurant_app/core/models/order.model.dart';

class OrderDetils extends StatelessWidget {
  const OrderDetils({super.key, required this.order});
  final OrdersModel order;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('رقم الطلب: ${order.id}'),
          const Text('الوجبات'),
          Expanded(
              child: ListView(
            children: [
              ...order.products.map((e) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('اسم الوجبة: ${e.nameAR}'),
                          const Text('الاضافات:'),
                          ...e.addstions.map((e) => Text(e.nameAR))
                        ],
                      ),
                    ),
                  ))
            ],
          ))
        ],
      ),
    );
  }
}
