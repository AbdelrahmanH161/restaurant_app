import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/models/product.model.dart';
import 'package:restaurant_app/screen/ProductDetail.screen.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key, required this.listProduct});
  List<ProductsModel> listProduct;
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
          listProduct: listProduct,
        ));
  }
}

class _ListveiwProduct extends StatelessWidget {
  const _ListveiwProduct({super.key, required this.listProduct});
  final List<ProductsModel> listProduct;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...listProduct.map((e) => InkWell(
              onTap: () {
                Get.to(ProductDetailScreen(product: e));
              },
              child: Card(
                child: Row(
                  children: [
                    Image.network(
                      e.image,
                      width: 60,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(e.nameAR),
                        const SizedBox(
                          height: 10,
                        ),
                        
                      ],
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
