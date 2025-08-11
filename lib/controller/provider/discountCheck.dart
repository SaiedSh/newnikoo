import 'package:flutter/material.dart';

class DiscountCheckState extends ChangeNotifier {
  static String? discountCheck;
  getDiscountMassage({required String value}) {
    discountCheck = value;
    notifyListeners();
  }
}
