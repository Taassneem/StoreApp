import 'dart:developer';

import 'package:store_app/helper/api.dart';

import '../models/prodect_model.dart';

class UpdateService {
  Future<ProductModel> updateProduct(
      {required dynamic id,
      required String title,
      required String description,
      required String price,
      required String image,
      required String category}) async {
    log('product id is $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      data: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category
      },
      token: '',
    );
    return ProductModel.fromJson(data);
  }
}
