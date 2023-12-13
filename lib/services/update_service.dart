import 'package:store_app/helper/api.dart';

import '../models/prodect_model.dart';

class UpdsteService{
Future<ProductModel> updateProduct({required int id,required String title,
      required String description,
      required String price,
      required String image,
      required String category})async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products/$id',
      data: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category
      }, token: '',
    );
    return ProductModel.fromJson(data);
  }
}