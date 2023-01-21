import 'package:cloud_firestore/cloud_firestore.dart';

class AddtionService {
  Future<List<QueryDocumentSnapshot>> getproductservice(
      String restorantId, String ProductID) async {
    final CollectionReference _addtionCollectionRef = FirebaseFirestore.instance
        .collection(
            '/Restaurants/${restorantId}/Products/${ProductID}/Additions');
    var data = await _addtionCollectionRef.get();
    print('sjkdhsjkhd');
    return data.docs;
  }
}
