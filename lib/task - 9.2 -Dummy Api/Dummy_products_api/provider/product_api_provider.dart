import 'package:adv_flutter_ch_9/helper/Dummy/product_api_helper/product_api_helper.dart';
import 'package:adv_flutter_ch_9/helper/Dummy/recepies_api_helper/recepies_api_helper.dart';
import 'package:adv_flutter_ch_9/task%20-%209.2%20-Dummy%20Api/Dummy_products_api/modal/product_api_modal.dart';
import 'package:flutter/material.dart';

class ProductApiProvider extends ChangeNotifier {
  ProductApiHelper productApiHelper = ProductApiHelper();
  ProductModal? productModal;

  Future<ProductModal?> fromMap() async {
    final data = await productApiHelper.fetchResApiData();
    productModal = ProductModal.fromJson(data);
    return productModal;
  }

  void removeqty(int index) {}

  void addQty(int index) {}
}
