import 'package:flutter/foundation.dart';

class RestaurantModel {
  String id;
  String name;
  String logo;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json, String Id) =>
      RestaurantModel(
      id: Id!,
      name: json['nameAr']!, 
      logo: json['logo']!
      );
}
