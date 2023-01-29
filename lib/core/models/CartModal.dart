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
