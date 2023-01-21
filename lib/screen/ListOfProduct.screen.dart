import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/product.controller.dart';
import 'package:restaurant_app/screen/ProductDetail.screen.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key, required this.restorantId});
  final String restorantId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text(
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
    ProductController crt = Get.put(ProductController(restorantId));
    return GetBuilder<ProductController>(
        builder: (((controller) => ListView(
              children: [
                ...controller.productModel
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(()=> ProductDetailScreen(productModel: e ,restorantId:restorantId ,));
                            },
                            child: Row(
                              children: [
                                Image.network(
                                  e.image,
                                  width: 40,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(e.name)
                              ],
                            ),
                          ),
                        ))
                    .toList()
              ],
            ))));
  }
}
