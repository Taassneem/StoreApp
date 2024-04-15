// ignore_for_file: missing_required_param

import 'package:store_app/helper/api.dart';
import '../models/prodect_model.dart';

class GetAllProducts {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> response =
        await Api().get(url: 'https://fakestoreapi.com/products',);
    List<ProductModel> productList = [];
    for (int i = 0; i < response.length; i++) {
      productList.add(ProductModel.fromJson(response[i]));
    }
    return productList;
  }
}
