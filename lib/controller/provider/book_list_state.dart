import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:flutter/material.dart';

class BookListState extends ChangeNotifier {
  static List<BookDto> books = [];
  getBookList({required List<BookDto> value}) {
    books = value;
    notifyListeners();
  }
}
