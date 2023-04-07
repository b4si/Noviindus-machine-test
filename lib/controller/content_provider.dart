import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:noviindus_machine_test/services/content_services.dart';

class ContentProvider with ChangeNotifier {
  var contentList = [];

  Future<void> contentPreview(String categoryId) async {
    final response = await ContentServices().contentPreview(
      categoryId,
    );

    contentList.clear();
    contentList.add(response);
    log(contentList[0].results.toString());
    notifyListeners();
  }
}
