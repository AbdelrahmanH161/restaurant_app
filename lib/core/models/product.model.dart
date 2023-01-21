class ProductModel {
  String id;
  String name;
  String image;
  int price;
  int processingPeriod;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.processingPeriod,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, String Id) =>
      ProductModel(
      id: Id!,
      name: json['nameAr'], 
      image: json['image'],
      price: json['price'],
      processingPeriod: json['processingPeriod'],
      );

}
