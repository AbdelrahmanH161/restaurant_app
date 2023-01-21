import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/core/models/product.model.dart';

class ProductService {

  Future<List<QueryDocumentSnapshot>> getproductservice(String id) async {
    final CollectionReference _productCollectionRef = FirebaseFirestore.instance.collection('/Restaurants/${id}/Products');
    var data = await _productCollectionRef.get();
    return data.docs;
  }
}
