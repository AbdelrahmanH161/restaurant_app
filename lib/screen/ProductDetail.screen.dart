import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/controller/Additions.controller.dart';
import 'package:restaurant_app/core/controller/Cart.controller.dart';
import 'package:restaurant_app/core/models/CartModal.dart';
import 'package:restaurant_app/core/models/addition.model.dart';
import 'package:restaurant_app/core/models/product.model.dart';
import 'package:restaurant_app/screen/Cart.screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen(
      {super.key, required this.productModel, required this.restorantId});
  final ProductModel productModel;
  final String restorantId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int totalprice = 0;
  int totalAddition = 0;
  bool _isSelected = false;
  int _quantity = 1; 
  List<AdditionModel> _additionList= [];
  @override
  Widget build(BuildContext context) {
    CartController crtCart = Get.put(CartController());
    AdditionControler crt =
        Get.put(AdditionControler(widget.restorantId, widget.productModel.id));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(()=>CartScreen());
              },
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ))
        ],
        title: Text(widget.productModel.name),
      ),
      body: Column(
        children: [
          Image.network(widget.productModel.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'مدة التجهيز : ${widget.productModel.processingPeriod} دقيقه'),
              const SizedBox(
                width: 20,
              ),
              Text('السعر:${widget.productModel.price} ريال')
            ],
          ),
          Expanded(
            child: GetBuilder<AdditionControler>(
                builder: ((controller) => ListView(
                      children: [
                        ...controller.additionModel.map((e) => CheckboxListTile(
                            key: Key(e.id),
                            title: Text(e.name),
                            subtitle: Text('السعر:${e.price} ريال'),
                            value: e.isSelected,
                            onChanged: (bool? value) {
                              if (value == true) {
                                setState(() {
                                  totalAddition = totalAddition + e.price;
                                  e.isSelected = true;
                                });
                              } else {
                                setState(() {
                                  totalAddition = totalAddition - e.price;
                                  e.isSelected = false;
                                });
                              }
                              print(e.price);
                            })),
                      ],
                    ))),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('سعر الوجبة :'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('الكمية'),
                        IconButton(
                          onPressed: () {
                            if (_quantity != 1) {
                              setState(() {
                                _quantity = _quantity - 1;
                              });
                            }
                          },
                          icon: Icon(Icons.minimize),
                          padding: const EdgeInsets.only(bottom: 15),
                        ),
                        Text('${_quantity}'),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _quantity = _quantity + 1;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                    Text('${widget.productModel.price * _quantity} ريال')
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('سعر الاضافات :'),
                    Text('${totalAddition * _quantity} ريال')
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('اجمالي السعر:'),
                Text(
                    '${(widget.productModel.price + totalAddition) * _quantity} ريال')
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ElevatedButton(
                  child: Text('اضافة الي العربة'),
                  onPressed: () {
                    crtCart.addToCrat(
                      CartModal(restorantId: widget.restorantId, product: widget.productModel, addition: _additionList, quantity: _quantity)
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
