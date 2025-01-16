import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:flutter/material.dart';

class SearchFillterState extends ChangeNotifier {
  static List<BookDto> subscriptions = [];
  getList({required List<BookDto> value}) {
    subscriptions = value;
    notifyListeners();
  }

  void reset() {
    subscriptions.clear();
    notifyListeners();
  }
}
