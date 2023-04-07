import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:noviindus_machine_test/core/core.dart';
import 'package:noviindus_machine_test/model/content_model.dart';

class ContentServices {
  Future contentPreview(String categoryId) async {
    try {
      final formData = FormData.fromMap({
        'category': categoryId,
      });
      Response response = await Dio().post(
        '${baseUrl}news-and-blogs-catg',
        data: formData,
      );
      final content = ContendModel.fromJson(response.data);
      log(content.results[1].toString());
      return content;
    } catch (e) {
      log('$e------->');
    }
  }
}
