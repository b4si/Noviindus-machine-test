import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:noviindus_machine_test/services/category_services.dart';

class CategoryProvider with ChangeNotifier {
  var categoryList = [];

  Future<void> categoryPreview() async {
    final resposne = await CategoryServices().categoryPreview();
    categoryList.clear();
    categoryList.add(resposne);
    log(categoryList.toString());
    notifyListeners();
  }
}
