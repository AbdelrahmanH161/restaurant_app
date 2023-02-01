import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/core/models/order.model.dart';

class OrderService {

  orderUpdata(String orderid, String value) async{
    final CollectionReference _OrderCollectionRef = FirebaseFirestore.instance
        .collection('Restaurants/6YweKA8AHeDLGaAVQIdU/Orders');
    var data = await _OrderCollectionRef.doc(orderid).update({'type': value});
    return data;
  }

  Stream<List<OrdersModel>> getNewOrderStream() {
    return FirebaseFirestore.instance
        .collection('Restaurants/6YweKA8AHeDLGaAVQIdU/Orders')
        .where('type', isEqualTo: 'pending')
        .snapshots()
        .map((QuerySnapshot query) {
      List<OrdersModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(OrdersModel.fromJson(
            element.data() as Map<String, dynamic>, element.id));
      });
      return retVal;
    });
  }

  Stream<List<OrdersModel>> getacceptOrderStream() {
    return FirebaseFirestore.instance
        .collection('Restaurants/6YweKA8AHeDLGaAVQIdU/Orders')
        .where('type', isEqualTo: 'accept')
        .snapshots()
        .map((QuerySnapshot query) {
      List<OrdersModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(OrdersModel.fromJson(
            element.data() as Map<String, dynamic>, element.id));
      });
      return retVal;
    });
  }

  Stream<List<OrdersModel>> getreadyOrderStream() {
    return FirebaseFirestore.instance
        .collection('Restaurants/6YweKA8AHeDLGaAVQIdU/Orders')
        .where('type', isEqualTo: 'ready')
        .snapshots()
        .map((QuerySnapshot query) {
      List<OrdersModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(OrdersModel.fromJson(
            element.data() as Map<String, dynamic>, element.id));
      });
      return retVal;
    });
  }

  Stream<List<OrdersModel>> getfinishedOrderStream() {
    return FirebaseFirestore.instance
        .collection('Restaurants/6YweKA8AHeDLGaAVQIdU/Orders')
        .where('type', isEqualTo: 'finished')
        .snapshots()
        .map((QuerySnapshot query) {
      List<OrdersModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(OrdersModel.fromJson(
            element.data() as Map<String, dynamic>, element.id));
      });
      return retVal;
    });
  }

  addOrder(OrdersModel item, String restorantId) {
    final CollectionReference _OrderCollectionRef = FirebaseFirestore.instance
        .collection('Restaurants/$restorantId/Orders');
    var data = _OrderCollectionRef.add(item.toJson());
    return data;
  }

}
