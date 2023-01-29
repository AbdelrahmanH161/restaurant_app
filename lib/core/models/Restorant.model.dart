import 'package:restaurant_app/core/models/order.model.dart';
import 'package:restaurant_app/core/models/product.model.dart';

class RestaurantsModel {
  RestaurantsModel({
    required this.info,
  });
  late final Info info;

  RestaurantsModel.fromJson(Map<String, dynamic> json) {
    info = Info.fromJson(json['info']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['info'] = info.toJson();
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
    required this.rate,
    required this.logo,
    required this.tel,
  });
  late final String nameAR;
  late final String nameEN;
  late final int index;
  late final bool isActive;
  late final Locations locations;
  late final int rate;
  late final String logo;
  late final String tel;

  Info.fromJson(Map<String, dynamic> json) {
    nameAR = json['nameAR'];
    nameEN = json['nameEN'];
    index = json['index'];
    isActive = json['isActive'];
    locations = Locations.fromJson(json['locations']);
    rate = json['rate'];
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
    _data['rate'] = rate;
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
