import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:flutter/material.dart';

class CategoryState extends ChangeNotifier {
  static List<CategoryDto> categories = [];
  static List<CategoryDto> categoriesChild = [];
  getCategory({required List<CategoryDto> value}) {
    categories = value;
    notifyListeners();
  }

  getChildCategory({required List<CategoryDto> value}) {
    categoriesChild = value;
    notifyListeners();
  }
}

class ProductsState extends ChangeNotifier {
  static List<BookDto> books = [];
  getBooksByCategory({required List<BookDto> value}) {
    books = value;
    notifyListeners();
  }
}
