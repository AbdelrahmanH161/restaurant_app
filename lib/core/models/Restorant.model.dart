import 'package:restaurant_app/core/models/order.model.dart';
import 'package:restaurant_app/core/models/product.model.dart';

class RestaurantsModel {
  RestaurantsModel({
    required this.uid,
    required this.info,
    required this.orders,
    required this.products,
  });
  late final String uid;
  late final Info info;
  late final List<OrdersModel> orders;
  late final List<ProductsModel> products;

  RestaurantsModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    info = Info.fromJson(json['info']);
    orders =
        List.from(json['orders']).map((e) => OrdersModel.fromJson(e)).toList();
    products = List.from(json['products'])
        .map((e) => ProductsModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uid'] = uid;
    _data['info'] = info.toJson();
    _data['orders'] = orders.map((e) => e.toJson()).toList();
    _data['products'] = products.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Info {
  Info({
    required this.nameAR,
    required this.nameEN,
    required this.index,
    required this.isActive,
    required this.locations,
    required this.logo,
    required this.tel,
  });
  late final String nameAR;
  late final String nameEN;
  late final int index;
  late final bool isActive;
  late final Locations locations;
  late final String logo;
  late final String tel;

  Info.fromJson(Map<String, dynamic> json) {
    nameAR = json['nameAR'];
    nameEN = json['nameEN'];
    index = json['index'];
    isActive = json['isActive'];
    locations = Locations.fromJson(json['locations']);
    logo = json['logo'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nameAR'] = nameAR;
    _data['nameEN'] = nameEN;
    _data['index'] = index;
    _data['isActive'] = isActive;
    _data['locations'] = locations.toJson();
    _data['logo'] = logo;
    _data['tel'] = tel;
    return _data;
  }
}

class Locations {
  Locations({
    required this.latitude,
    required this.longitude,
  });
  late final String latitude;
  late final String longitude;

  Locations.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    return _data;
  }
}
