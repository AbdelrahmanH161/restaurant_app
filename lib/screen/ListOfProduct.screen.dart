import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Product.controller.dart';
import 'package:restaurant_app/screen/ProductDetail.screen.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key, required this.restorantId});
  final String restorantId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: const Text(
            'قائم الوجبات',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        body: _ListveiwProduct(
          restorantId: restorantId,
        ));
  }
}

class _ListveiwProduct extends StatelessWidget {
  const _ListveiwProduct({super.key, required this.restorantId});
  final String restorantId;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: Get.put(ProductController(restorantId)),
      builder: (controller) => ListView(
        children: [
          ...controller.productsList
              .map((e) => InkWell(
                    onTap: () {
                      Get.to(() => ProductDetailScreen(
                          product: e, restorantId: restorantId));
                    },
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            e.image,
                            width: 60,
                          ),
                          Column(
                            children: [
                              Text(e.nameAR),
                              Text('مده التجهيز: ${e.preparationTime} دقيقة')
                            ],
                          ),
                          Text(
                            'السعر : ${e.price} ريال',
                            style: TextStyle(color: Colors.amber[300]),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
