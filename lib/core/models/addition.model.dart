class AdditionsModel {
  AdditionsModel({
    required this.nameAR,
    required this.nameEN,
    required this.index,
    required this.isActive,
    required this.price,
  });
  late final String nameAR;
  late final String nameEN;
  late final int index;
  late final bool isActive;
  late final String price;
  bool isSelected = false;

  AdditionsModel.fromJson(Map<String, dynamic> json) {
    nameAR = json['nameAR'];
    nameEN = json['nameEN'];
    index = json['index'];
    isActive = json['isActive'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nameAR'] = nameAR;
    _data['nameEN'] = nameEN;
    _data['index'] = index;
    _data['isActive'] = isActive;
    _data['price'] = price;
    return _data;
  }
}
