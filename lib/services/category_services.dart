import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:noviindus_machine_test/core/core.dart';
import 'package:noviindus_machine_test/model/category_model.dart';

class CategoryServices {
  Future categoryPreview() async {
    try {
      Response response = await Dio().get('${baseUrl}news-and-blogs');
      final category = CategoryModel.fromJson(response.data);
      return category;
    } catch (e) {
      log(e.toString());
    }
  }
}
