import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muyufar_game/domain/models/product_model.dart';

class ProductServiceLocal {
  static Future<List<ProductModel>> get() async {
    final response = await rootBundle.loadString('assets/data/product.json');
    final data = await jsonDecode(response);
    return List<ProductModel>.from(
        data['data'].map((e) => ProductModel.fromJson(e)));
  }
}
