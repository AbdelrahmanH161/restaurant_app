import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/restaurantview.controller.dart';
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
        builder: ((controller) => ListView(
              children: [
                ...controller.resturantModel
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(()=> ProductScreen(restorantId: e.id,));
                            },
                            child: Row(
                              children: [
                                Image.network(
                                  e.logo,
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
            )));
  }
}
