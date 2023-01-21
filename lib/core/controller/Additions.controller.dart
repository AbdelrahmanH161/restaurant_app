import 'package:get/get.dart';
import 'package:restaurant_app/core/models/addition.model.dart';
import 'package:restaurant_app/core/service/Additions.Service.dart';

class AdditionControler extends GetxController {
  AdditionControler(String restorantId, String productId) {
    getAdditions(restorantId, productId);
  }

  List<AdditionModel> get additionModel => _additionsModel;
  List<AdditionModel> _additionsModel = [];

  getAdditions(String restorantId, String productId) async {
    AddtionService().getproductservice(restorantId, productId).then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              _additionsModel.add(AdditionModel.fromJson(
                  value[i].data() as Map<String, dynamic>, value[i].id)),
              print(_additionsModel.length)
            },
          update(),
        });
  }
}
