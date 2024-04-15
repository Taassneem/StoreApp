// ignore_for_file: missing_required_param

import 'package:store_app/helper/api.dart';
import '../models/prodect_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required String description,
    required String price,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      data: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category
      },
    );
    return ProductModel.fromJson(data);
  }
}
