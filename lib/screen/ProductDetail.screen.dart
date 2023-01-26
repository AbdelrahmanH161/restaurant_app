import 'package:flutter/material.dart';
import 'package:restaurant_app/core/models/product.model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductsModel product;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  int _additionPrice = 0;
  int totalPrice = 0;
  
  @override
  Widget build(BuildContext context) {
    totalPrice = ((int.parse(widget.product.price) + _additionPrice) * _quantity);
    return Scaffold(
        appBar: AppBar(
          actions: [],
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
                            totalPrice = ((int.parse(widget.product.price) +
                                    _additionPrice) *
                                _quantity);
                          });
                        } else {
                          setState(() {
                            _additionPrice =
                                _additionPrice - int.parse(e.price);
                            e.isSelected = false;
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
                  ElevatedButton(onPressed: () {}, child: Text('تاكيد الطلب')),
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
                  Text(' اجمالي السعر: ${totalPrice} ريال')
                ],
              ),
            ),
          ],
        ));
  }
}
