import 'package:restaurant_app/core/models/product.model.dart';

class OrdersModel {
  OrdersModel({
    required this.products,
    required this.total,
    required this.type,
    required this.userId,
    required this.orderTime,
  });
  late final List<ProductsModel> products;
  late final String total;
  late final String type;
  late final String userId;
  late final DateTime orderTime;
  

  OrdersModel.fromJson(Map<String, dynamic> json) {
    products = List.from(json['orders']).map((e) => ProductsModel.fromJson(e)).toList();
    total = json['total'];
    type = json['type'];
    userId = json['userId'];
    orderTime = json['orderTime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['products'] = products.map((e) => e.toJson()).toList();
    _data['total'] = total;
    _data['type'] = type;
    _data['userId'] = userId;
    _data['orderTime'] = orderTime;
    return _data;
  }
}
