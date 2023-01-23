import 'package:restaurant_app/core/models/addition.model.dart';
import 'package:restaurant_app/core/models/product.model.dart';

class CartModal {
  String restorantId;
  ProductModel product;
  List<AdditionModel> addition;
  int quantity;

  CartModal({
    required this.restorantId,
    required this.product,
    required this.addition,
    required this.quantity,
  });
}
