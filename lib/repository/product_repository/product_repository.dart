import 'package:meelmedicose/data/network/network_api_services.dart';
import 'package:meelmedicose/models/product/product_list_model.dart';

import '../../res/app_url/app_url.dart';

class ProductRepository {
  final _apiService = NetworkApiServices();
  Future<ProductListModel> productListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.productListApi);
    return ProductListModel.fromJson(response);
  }
}
