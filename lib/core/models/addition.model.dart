class AdditionModel {
  String id;
  String name;
  int price;
  bool isSelected = false;
  AdditionModel({required this.id, required this.name, required this.price, r});

  factory AdditionModel.fromJson(Map<String, dynamic> json, String Id) =>
      AdditionModel(
        id: Id!,
        name: json['nameAr']!,
        price: json['price']!,
      );
}
