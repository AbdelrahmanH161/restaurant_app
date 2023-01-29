import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Cart.controller.dart';
import 'package:restaurant_app/core/models/Addition.model.dart';
import 'package:restaurant_app/core/models/CartModal.dart';
import 'package:restaurant_app/core/models/product.model.dart';
import 'package:restaurant_app/screen/Cart.screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen(
      {super.key, required this.product, required this.restorantId});
  final ProductsModel product;
  final String restorantId;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  int _additionPrice = 0;
  int totalPrice = 0;
  List<AdditionsModel> addtions = [];
  @override
  Widget build(BuildContext context) {
    totalPrice =
        ((int.parse(widget.product.price) + _additionPrice) * _quantity);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(CartScreen());
                },
                icon: const Icon(Icons.shopping_bag_outlined))
          ],
          title: Text(widget.product.nameAR),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.product.image,
              scale: 1,
            ),
            Center(
                child: Text(
              widget.product.nameAR,
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('السعر : ${widget.product.price} ريال'),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...widget.product.addstions.map((e) => CheckboxListTile(
                      title: Text(e.nameAR),
                      subtitle: Text('السعر:${e.price} ريال'),
                      value: e.isSelected,
                      onChanged: (bool? value) {
                        if (value == true) {
                          setState(() {
                            _additionPrice =
                                _additionPrice + int.parse(e.price);
                            e.isSelected = true;
                            addtions.add(e);
                            totalPrice = ((int.parse(widget.product.price) +
                                    _additionPrice) *
                                _quantity);
                          });
                        } else {
                          setState(() {
                            _additionPrice =
                                _additionPrice - int.parse(e.price);
                            e.isSelected = false;
                            addtions.remove(e);
                            totalPrice = ((int.parse(widget.product.price) +
                                    _additionPrice) *
                                _quantity);
                          });
                        }
                      }))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<CartController>(
                    builder: ((controller) => ElevatedButton(
                        onPressed: () {
                          controller.addToCart(CartModal(
                            restorantId: widget.restorantId,
                            product: ProductsModel(
                                index: widget.product.index,
                                isActive: widget.product.isActive,
                                price: widget.product.price,
                                nameAR: widget.product.nameAR,
                                nameEN: widget.product.nameEN,
                                addstions: addtions,
                                image: widget.product.image,
                                preparationTime: widget.product.preparationTime,
                                rate: widget.product.rate),
                            quantity: _quantity,
                            total: totalPrice,
                          ));
                        },
                        child: const Text('اصافة الي العربه'))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_quantity != 1) {
                            setState(() {
                              _quantity = _quantity - 1;
                            });
                          }
                        },
                        icon: const Icon(Icons.minimize),
                        padding: const EdgeInsets.only(bottom: 15),
                      ),
                      Text('$_quantity'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _quantity = _quantity + 1;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  Text(' اجمالي السعر: $totalPrice ريال')
                ],
              ),
            ),
          ],
        ));
  }
}
