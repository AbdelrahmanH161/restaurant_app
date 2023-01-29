import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {

  Future<List<QueryDocumentSnapshot>> getProducts(String restaurantId) async {
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Restaurants/$restaurantId/Products');
    var data = await _productCollectionRef.get();
    return data.docs;
  }


}