part of '../controllers.dart';

class MoreController {
  late List<ProductModel> product;
  late List<ProductModel> searchProduct;

  bool isSearch = false;
  void setSearch(String query) {
    searchProduct = product
        .where((elem) =>
            elem.name.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    isSearch = true;
  }
}
