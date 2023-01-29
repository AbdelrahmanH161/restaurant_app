import 'package:cloud_firestore/cloud_firestore.dart';

class RestorantService {
  final CollectionReference _restorantCollectionRef =
      FirebaseFirestore.instance.collection('Restaurants');

  Future<List<QueryDocumentSnapshot>> getRestorants() async {
    var data = await _restorantCollectionRef.get();
    return data.docs;
  }
}
