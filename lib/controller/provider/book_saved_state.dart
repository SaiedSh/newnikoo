import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:flutter/material.dart';

class BookSavedState extends ChangeNotifier {
  static List<BookDto> savedBooks = [];
  getSavedBook({required List<BookDto> value}) {
    savedBooks = value;
    notifyListeners();
  }

  void reset() {
    savedBooks.clear();
    notifyListeners();
  }
}
