import 'package:store_app/helper/api.dart';

class ALlCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> response =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
  // List<dynamic> categories = response.data;
  return response;

  }
}
