import 'package:restaurant_app/core/models/Addition.model.dart';
import 'package:restaurant_app/core/models/product.model.dart';

class CartModal {
  String restorantId;
  ProductsModel product;
  int quantity;
  int total;
  CartModal({
    required this.restorantId,
    required this.product,
    required this.quantity,
    required this.total,
  });
}

class ProductOrderModel {
  late final String restorantId;
  final String nameAR;
  final String nameEN;
  final String image;
  final String preparationTime;
  int quantity;
  final String price;
  final List<AdditionsModel> addstions;

  ProductOrderModel({
    required this.restorantId,
    required this.nameAR,
    required this.nameEN,
    required this.image,
    required this.preparationTime,
    required this.price,
    required this.quantity,
    required this.addstions,
  });

  ProductOrderModel.fromJson(Map<String, dynamic> json)
      : nameAR = json['nameAR'],
        nameEN = json['nameEN'],
        image = json['image'],
        price = json['price'],
        quantity = json['quantity'],
        preparationTime = json['preparationTime'],
        addstions = List.from(json['addstions'])
            .map((e) => AdditionsModel.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['price'] = price;
    _data['nameAR'] = nameAR;
    _data['nameEN'] = nameEN;
    _data['image'] = image;
    _data['quantity'] = quantity;
    _data['preparationTime'] = preparationTime;
    _data['addstions'] = addstions.map((e) => e.toJson()).toList();
    return _data;
  }
}
