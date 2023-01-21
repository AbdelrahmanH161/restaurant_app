import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/models/product.model.dart';
import 'package:restaurant_app/core/service/Product.service.dart';

class ProductController extends GetxController {
  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  ProductController (String restorantId) {
    getProduct(restorantId);
  }
  getProduct(String restorantId) async {
    ProductService().getproductservice(restorantId).then((value) => {
      for(int i = 0; i< value.length ; i++){
        _productModel.add(ProductModel.fromJson(value[i].data() as Map<String, dynamic>, value[i].id))
      },
    update()
    });
  }
}
