import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/core/models/Restorant.model.dart';
import 'package:restaurant_app/core/service/Restorant.service.dart';

class RestorantController extends GetxController {
  List<RestaurantsModel> _restaurants = [];
  List<RestaurantsModel> get restaurantsList => _restaurants;
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
    await restaurant.get().then((value) => {
          for (int i = 0; i < value.docs.length; i++)
            {
              _restaurants.add(RestaurantsModel.fromJson(
                  value.docs[i].data() as Map<String, dynamic>)),
            },
          // print(_restaurants.length)
        });
    update();
  }
}
