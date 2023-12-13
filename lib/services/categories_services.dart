import 'package:store_app/helper/api.dart';
import '../models/prodect_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategories(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    // List<dynamic> products = response.data;

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
