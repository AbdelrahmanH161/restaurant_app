import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Restaurant.controller.dart';
import 'package:restaurant_app/core/models/Addition.model.dart';
import 'package:restaurant_app/core/models/Restorant.model.dart';
import 'package:restaurant_app/core/models/order.model.dart';
import 'package:restaurant_app/core/models/product.model.dart';
import 'package:restaurant_app/screen/ListOfProduct.screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestorantController ctr = Get.put(RestorantController());
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: Text(
            'المطاعم',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        body: _ListveiwRestorant());
  }
}

class _ListveiwRestorant extends StatelessWidget {
  const _ListveiwRestorant({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestorantController>(
        init: RestorantController(),
        builder: ((controller) => ListView(
              children: [
                ...controller.restaurantsList.map((e) => InkWell(
                      onTap: () {
                        Get.to(ProductScreen(
                          listProduct: e.products,
                        ));
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Image.network(
                              e.info.logo,
                              width: 60,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(e.info.nameAR),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(e.info.tel),
                                    const Icon(Icons.phone),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            )));
  }
}
