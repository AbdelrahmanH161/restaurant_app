import 'package:restaurant_app/core/models/product.model.dart';

class OrdersModel {
  OrdersModel({
    required this.products,
    required this.total,
    required this.type,
    required this.orderTime,
  });
  late final ProductsModel products;
  late final String total;
  late final String type;
  late final DateTime orderTime;


  OrdersModel.fromJson(Map<String, dynamic> json) {
    products = ProductsModel.fromJson(json['products']);
    total = json['total'];
    type = json['type'];
    orderTime = json['orderTime'].toDate();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['products'] = products.toJson();
    _data['total'] = total;
    _data['type'] = type;
    _data['orderTime'] = orderTime;
    return _data;
  }
}
