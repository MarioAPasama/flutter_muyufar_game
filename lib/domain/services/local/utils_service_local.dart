import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muyufar_game/domain/models/utils_model.dart';

class UtilsServiceLocal {
  static Future<UtilsModel> get() async {
    final response = await rootBundle.loadString('assets/data/utils.json');

    // log(response);
    final data = await jsonDecode(response);
    return UtilsModel.fromJson(data['data']);
  }
}
