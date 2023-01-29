import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Cart.controller.dart';
import 'package:restaurant_app/core/controller/Restaurant.controller.dart';
import 'package:restaurant_app/screen/ListOfProduct.screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestorantController ctr = Get.put(RestorantController());
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: const Text(
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
    CartController ctr = Get.put(CartController());
    return GetBuilder<RestorantController>(
        init: RestorantController(),
        builder: ((controller) => ListView.builder(
            itemCount: controller.restaurantsList.length,
            itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.to(() => ProductScreen(
                          restorantId: controller.restaurantid[index],
                        ));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Image.network(
                          controller.restaurantsList[index].info.logo,
                          width: 60,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(controller.restaurantsList[index].info.nameAR),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    controller.restaurantsList[index].info.tel),
                                const Icon(Icons.phone),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
