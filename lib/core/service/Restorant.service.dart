import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/core/models/Restorant.model.dart';

class RestorantService {
  final CollectionReference _restorantCollectionRef =
      FirebaseFirestore.instance.collection('Restaurants');

  Future<List<QueryDocumentSnapshot>> getRestorantapi() async {
    var data = await _restorantCollectionRef.get();
    return data.docs;
  }
}
