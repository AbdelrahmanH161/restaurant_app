import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/models/product.model.dart';
import 'package:restaurant_app/core/service/Product.service.dart';

class ProductController extends GetxController {
  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];
  ProductService productService = new ProductService();
  ProductController (restorantId) {
    getProduct(restorantId);
  }
  getProduct(String restorantId) async {
    _productModel = await productService.getproductservice(restorantId);
    update();
  }
}
