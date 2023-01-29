import 'package:get/get.dart';
import 'package:restaurant_app/core/models/product.model.dart';
import 'package:restaurant_app/core/service/Product.service.dart';

class ProductController extends GetxController {
  final List<ProductsModel> _productsList = [];
  List<ProductsModel> get productsList => _productsList;

  ProductController(String restaurantId) {
    getproductsList(restaurantId);
  }

  getproductsList(String restaurantId) async{
  await ProductService().getProducts(restaurantId).then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              _productsList.add(ProductsModel.fromJson(
                  value[i].data() as Map<String, dynamic>)),
            },
        });
    update();
  }
}
