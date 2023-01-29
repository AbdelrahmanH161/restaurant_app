import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/models/Restorant.model.dart';
import 'package:restaurant_app/core/service/Restorant.service.dart';

class RestorantController extends GetxController {
  final List<RestaurantsModel> _restaurants = [];
  List<RestaurantsModel> get restaurantsList => _restaurants;
  
  final List<String> _restaurantid = [];
  List<String> get restaurantid => _restaurantid;

  CollectionReference restaurant =
      FirebaseFirestore.instance.collection('Restaurants');

  RestorantController() {
    getRestaurantList();
  }

  AddRestaurant(rest) {
    restaurant
        .add(rest)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  getRestaurantList() async {
    await RestorantService().getRestorants().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              _restaurantid.add(value[i].id),
              _restaurants.add(RestaurantsModel.fromJson(
                  value[i].data() as Map<String, dynamic>)),
            },
          // print(_restaurants.length)
        });
    update();
  }
}
