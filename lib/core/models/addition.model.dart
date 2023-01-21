class AdditionModel {
  String id;
  String name;
  int price;

  AdditionModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory AdditionModel.fromJson(Map<String, dynamic> json, String Id) =>
      AdditionModel(
      id: Id!,
      name: json['nameAr']!, 
      price: json['price']!,
      );
}
