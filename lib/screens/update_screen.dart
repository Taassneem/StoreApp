// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/prodect_model.dart';
import 'package:store_app/services/update_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateScreen extends StatefulWidget {
  static String id = "update-screen";

  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String? productName, image, title, description, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  labelText: 'Product Name',
                  onChange: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChange: (data) {
                      description = data;
                    },
                    labelText: 'Description'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data) {
                    price = data;
                  },
                  labelText: 'Price',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    onChange: (data) {
                      image = data;
                    },
                    labelText: 'image'),
                const SizedBox(
                  height: 50,
                ),
                CustomElevatedButton(
                  text: 'Update',
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProdeuct(productModel);
                      log('success');
                    } catch (e) {
                      log(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProdeuct(ProductModel productModel) async {
    await UpdateService().updateProduct(
        id: productModel.id,
        title: productName == null ? productModel.title : productName!,
        description:
            description == null ? productModel.description : description!,
        price: price == null ? productModel.price.toString() : price!,
        image: image == null ? productModel.image : image!,
        category: productModel.category);
  }
}
