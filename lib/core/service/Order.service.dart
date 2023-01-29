import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/core/models/CartModal.dart';
import 'package:restaurant_app/core/models/order.model.dart';

class OrderService {
  addOrder(OrdersModel item, String restorantId) {
    final CollectionReference _OrderCollectionRef = FirebaseFirestore.instance
        .collection('Restaurants/$restorantId/Orders');
    var data = _OrderCollectionRef.add(item.toJson());
    return data;
  }
}
