import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plp/data/model/seller_model.dart';
import 'package:plp/data/services/seller_service.dart';
import 'package:plp/common/static_values.dart';

class HomeController extends GetxController {
  var box = GetStorage();
  var isLoading = false;
  List<Seller> sellers = [];

  @override
  void onInit() {
    fetchSellers();

    if (box.read(StaticValues.SELLER_DATA) != null)
      sellers.assignAll(box.read(StaticValues.SELLER_DATA));
    super.onInit();
  }

  void fetchSellers() async {
    try {
      isLoading = true;
      update();

      var _data = await SellerService.getSellers();
      print(_data);

      if (_data != null) {
        sellers.assignAll(_data);
        box.write(StaticValues.SELLER_DATA, _data);
      }
    } finally {
      isLoading = false;
      update();
    }
  }
}
