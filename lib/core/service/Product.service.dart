import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_app/core/models/product.model.dart';

class ProductService {

Future <List<ProductModel>> getproductservice (String id) async {

  final CollectionReference _productCollectionRef = FirebaseFirestore.instance.collection('/Restaurants/${id}/Products');
  List<ProductModel> data = [];
  var res;
  ProductModel datares;
  await _productCollectionRef.get().then((value) => {
          // print(value.docs[0].id),
          for (int i = 0; i < value.docs.length; i++)
            {
              res = value.docs[i].data() as dynamic,
              datares = new ProductModel(id: value.docs[i].id, name: res['nameAr'], image: res['image'], price: res['price'], processingPeriod: res['processingPeriod']),
              data.add(datares)
            },
        });
    return data;
}


}