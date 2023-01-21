import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/models/restaurant.model.dart';
import 'package:restaurant_app/core/service/Restorant.service.dart';

class RestorantController extends GetxController {
  List<RestaurantModel> get resturantModel => _resturantModel;
  List<RestaurantModel> _resturantModel = [];
  RestorantController() {
    getRestorant();
  }
  getRestorant() async {
    RestorantService().getRestorantapi().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              print(value[i].data()),
              _resturantModel.add(RestaurantModel.fromJson(
                  value[i].data() as Map<String, dynamic>, value[i].id))
            },
          update()
        });
    print(_resturantModel.length);
  }
}
