import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Additions.controller.dart';
import 'package:restaurant_app/core/models/product.model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productModel, required this.restorantId});
  final ProductModel productModel;
  final String restorantId;
  @override
  Widget build(BuildContext context) {
    AdditionControler crt = Get.put(AdditionControler(restorantId,productModel.id));
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text(productModel.name),
      ),
      body: Column(
        children: [
          Image.network(productModel.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مدة التجهيز : ${productModel.processingPeriod} دقيقه'),
              SizedBox(
                width: 20,
              ),
              Text('السعر:${productModel.price} ريال')
            ],
          ),
          Expanded(
            child: GetBuilder<AdditionControler>(
                builder: ((controller) => ListView(
                      children: [
                        ...controller.additionModel.map((e) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(e.name),
                            SizedBox(width: 30,),
                            Text('السعر:${e.price}ريال')
                          ],
                        ))
                      ],
                    ))),
          )
        ],
      ),
    );
  }
}
