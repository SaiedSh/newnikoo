import 'package:bookapp/model/api/generated/tikonline.models.swagger.dart';
import 'package:flutter/material.dart';

class BookReviewState extends ChangeNotifier {
  static List<BookReviewDto> reviews = [];
  getBookReview({required List<BookReviewDto> value}) {
    reviews = value;
    notifyListeners();
  }
}
