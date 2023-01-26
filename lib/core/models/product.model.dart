import 'package:restaurant_app/core/models/Addition.model.dart';

class ProductsModel {
  ProductsModel({
    required this.index,
    required this.isActive,
    required this.price,
    required this.nameAR,
    required this.nameEN,
    required this.addstions,
    required this.image,
  });
  late final int index;
  late final bool isActive;
  late final String price;
  late final String image;
  late final String nameAR;
  late final String nameEN;
  late final List<AdditionsModel> addstions;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    isActive = json['isActive'];
    price = json['price'];
    nameAR = json['nameAR'];
    nameEN = json['nameEN'];
    image = json['image'];
    addstions = List.from(json['addstions'])
        .map((e) => AdditionsModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['index'] = index;
    _data['isActive'] = isActive;
    _data['price'] = price;
    _data['nameAR'] = nameAR;
    _data['nameEN'] = nameEN;
    _data['addstions'] = addstions.map((e) => e.toJson()).toList();
    return _data;
  }
}
