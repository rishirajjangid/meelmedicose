import 'package:get/get.dart';
import 'package:meelmedicose/models/product/product_list_model.dart';
import 'package:meelmedicose/repository/product_repository/product_repository.dart';

import '../../../data/response/status.dart';

class ProductController extends GetxController {
  final _api = ProductRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final productList = ProductListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setProductList(ProductListModel _value) => productList.value = _value;
  void setError(String _value) => error.value = _value;

  void productListApi() {
    _api.productListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setProductList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    // setRxRequestStatus(Status.LOADING);
    _api.productListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setProductList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
