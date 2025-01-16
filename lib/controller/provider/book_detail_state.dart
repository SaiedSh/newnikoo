import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:flutter/material.dart';

class BookDetailState extends ChangeNotifier {
  static BookDto? bookDetail;
  getBookDetail({required BookDto value}) {
    bookDetail = value;
    notifyListeners();
  }

  void reset() {
    bookDetail = null;
    notifyListeners();
  }
}
